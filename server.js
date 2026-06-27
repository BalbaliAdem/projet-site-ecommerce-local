const express    = require("express");
const cors       = require("cors");
const path       = require("path");
const nodemailer = require("nodemailer");
const db         = require("./db");

const app = express();

app.use(cors());
app.use(express.json());
app.use(express.static("public"));


//  CONFIG EMAIL  ← mets tes vraies infos ici

const transporter = nodemailer.createTransport({
    service: "gmail",                 // ou "outlook", "yahoo", etc.
    auth: {
        user: "TON_EMAIL@gmail.com",  // ← ton adresse email
        pass: "TON_MOT_DE_PASSE_APP"  // ← mot de passe d'application Gmail
    }
});

// Stockage temporaire des codes en attente (en mémoire)
// Structure : { email: { code, data, expireAt } }
const codesEnAttente = {};

// LOG TOUTES LES REQUETES ENTRANTES 
app.use((req, res, next) => {
    console.log("─────────────────────────────────────────");
    console.log(`[REQUETE] ${req.method} ${req.url}`);
    console.log(`[BODY]    `, req.body);
    next();
});

app.get("/", (req, res) => {
    res.sendFile(path.join(__dirname, "public", "index.html"));
});



//  INSCRIPTION — Étape 1 : envoyer le code
app.post("/api/inscription", async (req, res) => {
    console.log("[INSCRIPTION] Données reçues :", req.body);

    const { nom, prenom, email, telephone, mot_de_passe } = req.body;

    if (!nom || !prenom || !email || !telephone || !mot_de_passe) {
        const manquants = [];
        if (!nom)          manquants.push("nom");
        if (!prenom)       manquants.push("prenom");
        if (!email)        manquants.push("email");
        if (!telephone)    manquants.push("telephone");
        if (!mot_de_passe) manquants.push("mot_de_passe");
        return res.status(400).json({ success: false, message: "Champs manquants : " + manquants.join(", ") });
    }

    try {
        // Vérifier si email déjà utilisé
        const existant = await db.query(
            "SELECT id_utilisateur FROM utilisateurs WHERE email = ?",
            [email]
        );
        if (existant.length > 0) {
            return res.status(409).json({ success: false, message: "Cet email est déjà utilisé" });
        }

        // Générer code 6 chiffres
        const code = Math.floor(100000 + Math.random() * 900000).toString();
        const expireAt = Date.now() + 10 * 60 * 1000; // expire dans 10 minutes

        // Stocker temporairement
        codesEnAttente[email] = { code, data: { nom, prenom, email, telephone, mot_de_passe }, expireAt };

        console.log(`[INSCRIPTION] Code généré pour ${email} : ${code}`);

        // Envoyer l'email
        await transporter.sendMail({
            from: '"Ma Boutique" <TON_EMAIL@gmail.com>',
            to: email,
            subject: "🔐 Votre code de vérification",
            html: `
                <div style="font-family:Arial,sans-serif;max-width:480px;margin:auto;padding:30px;border-radius:12px;border:1px solid #e5e7eb;">
                    <h2 style="color:#6366f1;text-align:center;">Vérification de votre compte</h2>
                    <p>Bonjour <strong>${prenom} ${nom}</strong>,</p>
                    <p>Voici votre code de vérification :</p>
                    <div style="text-align:center;margin:30px 0;">
                        <span style="font-size:42px;font-weight:900;letter-spacing:12px;color:#1f2937;background:#f3f4f6;padding:16px 28px;border-radius:12px;">${code}</span>
                    </div>
                    <p style="color:#6b7280;font-size:13px;">Ce code expire dans <strong>10 minutes</strong>.</p>
                    <p style="color:#6b7280;font-size:13px;">Si vous n'avez pas créé de compte, ignorez cet email.</p>
                </div>
            `
        });

        console.log(`[INSCRIPTION] Email envoyé à ${email}`);
        res.json({ success: true, message: "Code envoyé par email", email });

    } catch (err) {
        console.error("[INSCRIPTION] ERREUR :", err.message);
        res.status(500).json({ success: false, message: "Erreur serveur : " + err.message });
    }
});



//  INSCRIPTION — Étape 2 : vérifier le code
app.post("/api/inscription/verifier", async (req, res) => {
    const { email, code } = req.body;

    if (!email || !code) {
        return res.status(400).json({ success: false, message: "Email et code requis" });
    }

    const entree = codesEnAttente[email];

    if (!entree) {
        return res.status(404).json({ success: false, message: "Aucune demande en attente pour cet email" });
    }

    if (Date.now() > entree.expireAt) {
        delete codesEnAttente[email];
        return res.status(410).json({ success: false, message: "Code expiré. Veuillez recommencer l'inscription." });
    }

    if (entree.code !== code.trim()) {
        return res.status(401).json({ success: false, message: "Code incorrect" });
    }

    // Code correct → créer le compte
    try {
        const { nom, prenom, telephone, mot_de_passe } = entree.data;

        const result = await db.query(
            "INSERT INTO utilisateurs (nom, prenom, email, telephone, mot_de_passe) VALUES (?, ?, ?, ?, ?)",
            [nom, prenom, email, telephone, mot_de_passe]
        );

        delete codesEnAttente[email]; // Nettoyer
        console.log("[INSCRIPTION] Compte créé avec succès, id :", Number(result.insertId));

        res.json({ success: true, message: "Compte créé avec succès ! Vous pouvez vous connecter." });

    } catch (err) {
        console.error("[INSCRIPTION VERIFY] ERREUR SQL :", err.message);
        res.status(500).json({ success: false, message: "Erreur serveur : " + err.message });
    }
});


//  RENVOI du code (si expiré ou non reçu)
app.post("/api/inscription/renvoyer", async (req, res) => {
    const { email } = req.body;
    const entree = codesEnAttente[email];

    if (!entree) {
        return res.status(404).json({ success: false, message: "Aucune demande en attente. Recommencez l'inscription." });
    }

    // Générer nouveau code
    const code = Math.floor(100000 + Math.random() * 900000).toString();
    entree.code = code;
    entree.expireAt = Date.now() + 10 * 60 * 1000;

    try {
        await transporter.sendMail({
            from: '"Ma Boutique" <TON_EMAIL@gmail.com>',
            to: email,
            subject: "🔐 Nouveau code de vérification",
            html: `
                <div style="font-family:Arial,sans-serif;max-width:480px;margin:auto;padding:30px;border-radius:12px;border:1px solid #e5e7eb;">
                    <h2 style="color:#6366f1;text-align:center;">Nouveau code de vérification</h2>
                    <p>Voici votre nouveau code :</p>
                    <div style="text-align:center;margin:30px 0;">
                        <span style="font-size:42px;font-weight:900;letter-spacing:12px;color:#1f2937;background:#f3f4f6;padding:16px 28px;border-radius:12px;">${code}</span>
                    </div>
                    <p style="color:#6b7280;font-size:13px;">Ce code expire dans <strong>10 minutes</strong>.</p>
                </div>
            `
        });
        res.json({ success: true, message: "Nouveau code envoyé" });
    } catch (err) {
        res.status(500).json({ success: false, message: "Erreur envoi email : " + err.message });
    }
});


//CONNEXION 
app.post("/api/connexion", async (req, res) => {
    console.log("[CONNEXION] Données reçues :", { email: req.body.email, mot_de_passe: req.body.mot_de_passe ? "****" : "NON" });

    const { email, mot_de_passe } = req.body;

    if (!email || !mot_de_passe) {
        return res.status(400).json({ success: false, message: "Champs manquants" });
    }

    try {
        const rows = await db.query(
            "SELECT id_utilisateur, nom, prenom, email, telephone FROM utilisateurs WHERE email = ? AND mot_de_passe = ?",
            [email, mot_de_passe]
        );

        if (rows.length === 0) {
            return res.status(401).json({ success: false, message: "Email ou mot de passe incorrect" });
        }

        const utilisateur = {
            id:        Number(rows[0].id_utilisateur),
            nom:       rows[0].nom,
            prenom:    rows[0].prenom,
            email:     rows[0].email,
            telephone: rows[0].telephone
        };
        res.json({ success: true, message: "Connexion réussie", utilisateur });

    } catch (err) {
        res.status(500).json({ success: false, message: "Erreur serveur : " + err.message });
    }
});


//COMMANDE 
app.post("/api/commande", async (req, res) => {
    const { nom, prenom, email, telephone, localisation, produit } = req.body;

    if (!nom || !prenom || !email || !telephone || !localisation || !produit) {
        const manquants = [];
        if (!nom)          manquants.push("nom");
        if (!prenom)       manquants.push("prenom");
        if (!email)        manquants.push("email");
        if (!telephone)    manquants.push("telephone");
        if (!localisation) manquants.push("localisation");
        if (!produit)      manquants.push("produit");
        return res.status(400).json({ success: false, message: "Champs manquants : " + manquants.join(", ") });
    }

    const prix = parseFloat(produit.prix) || 0;

    try {
        const resultCommande = await db.query(
            `INSERT INTO commandes (nom, prenom, email, telephone, localisation, total)
             VALUES (?, ?, ?, ?, ?, ?)`,
            [nom, prenom, email, telephone, localisation, prix]
        );
        const idCommande = Number(resultCommande.insertId);

        await db.query(
            `INSERT INTO commande_produits (id_commande, nom_produit, prix_unitaire, prix, quantite)
             VALUES (?, ?, ?, ?, ?)`,
            [idCommande, produit.nom || "", prix, prix, 1]
        );

        res.json({ success: true, message: "Commande enregistrée", id_commande: idCommande });

    } catch (err) {
        res.status(500).json({ success: false, message: "Erreur serveur : " + err.message });
    }
});


// ADMIN : CONNEXION 
app.post("/api/admin/connexion", async (req, res) => {
    const { email, mot_de_passe } = req.body;
    if (!email || !mot_de_passe)
        return res.status(400).json({ success: false, message: "Champs manquants" });

    try {
        const rows = await db.query(
            "SELECT id_utilisateur, nom, prenom, email, role FROM utilisateurs WHERE email = ? AND mot_de_passe = ? AND role = 'admin'",
            [email, mot_de_passe]
        );
        if (rows.length === 0)
            return res.status(401).json({ success: false, message: "Accès refusé" });

        const admin = {
            id:     Number(rows[0].id_utilisateur),
            nom:    rows[0].nom,
            prenom: rows[0].prenom,
            email:  rows[0].email,
            role:   rows[0].role
        };
        res.json({ success: true, admin });
    } catch (err) {
        res.status(500).json({ success: false, message: "Erreur serveur : " + err.message });
    }
});


// ADMIN : LISTE UTILISATEURS 
app.get("/api/admin/utilisateurs", async (req, res) => {
    try {
        const rows = await db.query(
            "SELECT id_utilisateur, nom, prenom, email, telephone, role, date_inscription FROM utilisateurs ORDER BY id_utilisateur DESC"
        );
        res.json({ success: true, utilisateurs: rows });
    } catch (err) {
        res.status(500).json({ success: false, message: "Erreur serveur : " + err.message });
    }
});


// ADMIN : LISTE COMMANDES 
app.get("/api/admin/commandes", async (req, res) => {
    try {
        const rows = await db.query(
            "SELECT id_commande, nom, prenom, email, telephone, localisation, total, date_commande FROM commandes ORDER BY id_commande DESC"
        );
        res.json({ success: true, commandes: rows });
    } catch (err) {
        res.status(500).json({ success: false, message: "Erreur serveur : " + err.message });
    }
});


// ADMIN : STATS 
app.get("/api/admin/stats", async (req, res) => {
    try {
        const [uRows] = await db.query("SELECT COUNT(*) AS total FROM utilisateurs");
        const [cRows] = await db.query("SELECT COUNT(*) AS total, IFNULL(SUM(total),0) AS ca FROM commandes");
        res.json({
            success: true,
            stats: {
                utilisateurs: Number(uRows.total),
                commandes:    Number(cRows.total),
                total:        parseFloat(cRows.ca)
            }
        });
    } catch (err) {
        res.status(500).json({ success: false, message: "Erreur serveur : " + err.message });
    }
});

// Variantes (taille + couleur + stock) d'un vêtement
app.get("/api/produit/:id/variantes", async (req, res) => {
    try {
        const rows = await db.query(
            `SELECT id_variante, taille, couleur, quantite
             FROM produit_variantes WHERE id_produit = ?
             ORDER BY FIELD(taille,'XS','S','M','L','XL','XXL','38','39','40','41','42','43','44'), couleur`,
            [parseInt(req.params.id)]
        );
        res.json({ success: true, variantes: rows });
    } catch (err) {
        res.status(500).json({ success: false, message: err.message });
    }
});

// Décrémenter le stock d'une variante après commande
app.post("/api/stock/decrementer", async (req, res) => {
    const { id_variante } = req.body;
    try {
        await db.query(
            "UPDATE produit_variantes SET quantite = GREATEST(0, quantite - 1) WHERE id_variante = ?",
            [id_variante]
        );
        res.json({ success: true });
    } catch (err) {
        res.status(500).json({ success: false, message: err.message });
    }
});


// STOCK : liste des produits d'une sous-catégorie (non-vêtements)
app.get("/api/produits/sous-categorie/:id", async (req, res) => {
    try {
        const rows = await db.query(
            `SELECT id_produit, nom_produit, quantite
             FROM produits_stock
             WHERE id_sous_categorie = ?`,
            [parseInt(req.params.id)]
        );
        res.json({ success: true, produits: rows });
    } catch (err) {
        console.error("[STOCK] ERREUR :", err.message);
        res.status(500).json({ success: false, message: err.message });
    }
});

// STOCK : décrémenter le stock d'un produit simple après commande
app.post("/api/stock/decrementer-simple", async (req, res) => {
    const { nom_produit, id_sous_categorie } = req.body;
    try {
        await db.query(
            `UPDATE produits_stock SET quantite = GREATEST(0, quantite - 1)
             WHERE nom_produit = ? AND id_sous_categorie = ?`,
            [nom_produit, id_sous_categorie]
        );
        res.json({ success: true });
    } catch (err) {
        res.status(500).json({ success: false, message: err.message });
    }
});

// Variantes
app.get("/api/produit/:id/variantes", async (req, res) => {
    try {
        const rows = await db.query(
            `SELECT id_variante, taille, couleur, quantite
             FROM produit_variantes WHERE id_produit = ?
             ORDER BY FIELD(taille,'XS','S','M','L','XL','XXL','38','39','40','41','42','43','44'), couleur`,
            [parseInt(req.params.id)]
        );
        res.json({ success: true, variantes: rows });
    } catch (err) {
        res.status(500).json({ success: false, message: err.message });
    }
});


// Décrémenter stock variante
app.post("/api/stock/decrementer", async (req, res) => {
    const { id_variante } = req.body;
    try {
        await db.query(
            "UPDATE produit_variantes SET quantite = GREATEST(0, quantite - 1) WHERE id_variante = ?",
            [id_variante]
        );
        res.json({ success: true });
    } catch (err) {
        res.status(500).json({ success: false, message: err.message });
    }
});


// STOCK : liste produits sous-catégorie
app.get("/api/produits/sous-categorie/:id", async (req, res) => {
    try {
        const rows = await db.query(
            `SELECT id_produit, nom_produit, quantite FROM produits_stock WHERE id_sous_categorie = ?`,
            [parseInt(req.params.id)]
        );
        res.json({ success: true, produits: rows });
    } catch (err) {
        res.status(500).json({ success: false, message: err.message });
    }
});


// STOCK : décrémenter produit simple
app.post("/api/stock/decrementer-simple", async (req, res) => {
    const { nom_produit, id_sous_categorie } = req.body;
    try {
        await db.query(
            `UPDATE produits_stock SET quantite = GREATEST(0, quantite - 1)
             WHERE nom_produit = ? AND id_sous_categorie = ?`,
            [nom_produit, id_sous_categorie]
        );
        res.json({ success: true });
    } catch (err) {
        res.status(500).json({ success: false, message: err.message });
    }
});


// STOCK : lire la quantité d'un produit (produits_stock)
app.get("/api/produit/:id/stock", async (req, res) => {
    try {
        const rows = await db.query(
            "SELECT quantite FROM produits_stock WHERE id_produit = ?",
            [parseInt(req.params.id)]
        );
        if (rows.length === 0) {
            return res.status(404).json({ success: false, message: "Produit introuvable" });
        }
        res.json({ success: true, quantite: rows[0].quantite });
    } catch (err) {
        res.status(500).json({ success: false, message: err.message });
    }
});

// STOCK : décrémenter un produit (produits_stock)
app.post("/api/produit/:id/decrementer", async (req, res) => {
    try {
        await db.query(
            "UPDATE produits_stock SET quantite = GREATEST(0, quantite - 1) WHERE id_produit = ?",
            [parseInt(req.params.id)]
        );
        res.json({ success: true });
    } catch (err) {
        res.status(500).json({ success: false, message: err.message });
    }
});

//  ADMIN : AJOUTER UN PRODUIT

// Mapping sous-catégorie → id_sous_categorie (à adapter selon ta BDD)
const SOUS_CAT_IDS = {
  // Vêtements
  'Homme':              1,
  'Femme':              2,
  'Enfant':             3,
  // Gaming
  'PC Gaming':          4,
  'Consoles':           5,
  'Audio & Casques':    6,
  // Maison
  'Salon':              7,
  'Cuisine':            8,
  'Décoration':         9,
  // Téléphone
  'Smartphones':       10,
  'Montres Connectées':11,
  'Accessoires':       12
};

app.post("/api/admin/produit/ajouter", async (req, res) => {
    const { categorie, sous_categorie, nom, prix, image, description, variantes, quantite } = req.body;

    if (!categorie || !sous_categorie || !nom || !prix || !image) {
        return res.status(400).json({ success: false, message: "Champs obligatoires manquants" });
    }

    const id_sous_categorie = SOUS_CAT_IDS[sous_categorie];
    if (!id_sous_categorie) {
        return res.status(400).json({ success: false, message: "Sous-catégorie inconnue : " + sous_categorie });
    }

    try {
        if (categorie === 'vetements' && variantes && variantes.length > 0) {
            // ── Produit avec variantes taille/couleur (vêtements) ──
            // 1. Insérer dans produit_variantes via l'id_produit
            //    On utilise un id fictif basé sur le nom (votre table produit_variantes
            //    a un id_produit qui peut correspondre à un id dans une table produits)
            //    → On insère d'abord dans produits_stock pour avoir un id
            const rProd = await db.query(
                `INSERT INTO produits_stock (nom_produit, quantite, id_sous_categorie, prix, image, description)
                 VALUES (?, ?, ?, ?, ?, ?)
                 ON DUPLICATE KEY UPDATE quantite = quantite`,
                [nom, 0, id_sous_categorie, prix, image, description || '']
            );
            const id_produit = Number(rProd.insertId);

            // 2. Insérer chaque variante
            for (const v of variantes) {
                await db.query(
                    `INSERT INTO produit_variantes (id_produit, taille, couleur, quantite)
                     VALUES (?, ?, ?, ?)`,
                    [id_produit, v.taille, v.couleur || 'Standard', v.quantite || 0]
                );
            }

            console.log("[ADMIN PRODUIT] Vêtement ajouté id:", id_produit, "variantes:", variantes.length);
            return res.json({ success: true, message: "Produit ajouté avec variantes", id_produit });

        } else {
            // ── Produit simple avec stock (gaming, maison, téléphone) ──
            const rProd = await db.query(
                `INSERT INTO produits_stock (nom_produit, quantite, id_sous_categorie, prix, image, description)
                 VALUES (?, ?, ?, ?, ?, ?)`,
                [nom, quantite || 0, id_sous_categorie, prix, image, description || '']
            );
            const id_produit = Number(rProd.insertId);

            console.log("[ADMIN PRODUIT] Produit simple ajouté id:", id_produit);
            return res.json({ success: true, message: "Produit ajouté", id_produit });
        }

    } catch (err) {
        console.error("[ADMIN PRODUIT] ERREUR SQL:", err.message);
        // Si la table n'a pas les colonnes prix/image/description, on réessaie sans elles
        try {
            const rFallback = await db.query(
                `INSERT INTO produits_stock (nom_produit, quantite, id_sous_categorie) VALUES (?, ?, ?)`,
                [nom, quantite || 0, id_sous_categorie]
            );
            return res.json({ success: true, message: "Produit ajouté (basique)", id_produit: Number(rFallback.insertId) });
        } catch (err2) {
            return res.status(500).json({ success: false, message: "Erreur SQL : " + err.message });
        }
    }
});

// ── CATEGORIES : liste complète (avec sous-catégories) 
app.get("/api/categories", async (req, res) => {
    try {
        const cats = await db.query(
            `SELECT id_categorie, nom_categorie, icone, ordre
             FROM categories ORDER BY ordre ASC, id_categorie ASC`
        );
        for (const cat of cats) {
            cat.sous_categories = await db.query(
                `SELECT id_sous_categorie, nom_sous_categorie, icone
                 FROM sous_categories WHERE id_categorie = ?
                 ORDER BY id_sous_categorie ASC`,
                [cat.id_categorie]
            );
        }
        res.json({ success: true, categories: cats });
    } catch (err) {
        console.error("[CATEGORIES] ERREUR :", err.message);
        res.status(500).json({ success: false, message: err.message });
    }
});

// ── CATEGORIES : ajouter une catégorie 
app.post("/api/admin/categorie", async (req, res) => {
    const { nom_categorie, icone, ordre } = req.body;
    if (!nom_categorie)
        return res.status(400).json({ success: false, message: "nom_categorie requis" });
    try {
        const result = await db.query(
            "INSERT INTO categories (nom_categorie, icone, ordre) VALUES (?, ?, ?)",
            [nom_categorie.trim(), icone || "ti-tag", parseInt(ordre) || 0]
        );
        console.log("[ADMIN] Catégorie ajoutée, id :", Number(result.insertId));
        res.json({ success: true, id_categorie: Number(result.insertId) });
    } catch (err) {
        console.error("[ADMIN CAT] ERREUR :", err.message);
        res.status(500).json({ success: false, message: err.message });
    }
});

// ── SOUS-CATEGORIES : ajouter 
app.post("/api/admin/sous-categorie", async (req, res) => {
    const { nom_sous_categorie, id_categorie, icone } = req.body;
    if (!nom_sous_categorie || !id_categorie)
        return res.status(400).json({ success: false, message: "Champs manquants" });
    try {
        const result = await db.query(
            "INSERT INTO sous_categories (nom_sous_categorie, id_categorie, icone) VALUES (?, ?, ?)",
            [nom_sous_categorie.trim(), parseInt(id_categorie), icone || "ti-folder"]
        );
        res.json({ success: true, id_sous_categorie: Number(result.insertId) });
    } catch (err) {
        console.error("[ADMIN SOUS-CAT] ERREUR :", err.message);
        res.status(500).json({ success: false, message: err.message });
    }
});

// ── PRODUITS : ajouter un produit au catalogue 
app.post("/api/admin/produit", async (req, res) => {
    const { nom_produit, prix, image_url, id_sous_categorie, quantite, est_vetement } = req.body;
    if (!nom_produit || !id_sous_categorie)
        return res.status(400).json({ success: false, message: "Champs manquants" });
    try {
        const result = await db.query(
            `INSERT INTO produits_catalogue
             (nom_produit, prix, image_url, id_sous_categorie, quantite, est_vetement)
             VALUES (?, ?, ?, ?, ?, ?)`,
            [
                nom_produit.trim(),
                parseFloat(prix) || 0,
                image_url || "",
                parseInt(id_sous_categorie),
                parseInt(quantite) || 0,
                est_vetement ? 1 : 0
            ]
        );
        res.json({ success: true, id_produit: Number(result.insertId) });
    } catch (err) {
        console.error("[ADMIN PRODUIT] ERREUR :", err.message);
        res.status(500).json({ success: false, message: err.message });
    }
});

// ── PRODUITS : liste par sous-catégorie (catalogue dynamique) ─
app.get("/api/produits/catalogue/:id_sous_categorie", async (req, res) => {
    try {
        const rows = await db.query(
            `SELECT id_produit, nom_produit, prix, image_url, quantite, est_vetement
             FROM produits_catalogue WHERE id_sous_categorie = ?
             ORDER BY id_produit DESC`,
            [parseInt(req.params.id_sous_categorie)]
        );
        res.json({ success: true, produits: rows });
    } catch (err) {
        res.status(500).json({ success: false, message: err.message });
    }
});

// ── PRODUITS : supprimer 
app.delete("/api/admin/produit/:id", async (req, res) => {
    try {
        await db.query(
            "DELETE FROM produits_catalogue WHERE id_produit = ?",
            [parseInt(req.params.id)]
        );
        res.json({ success: true });
    } catch (err) {
        res.status(500).json({ success: false, message: err.message });
    }
});

// ── CATEGORIES : supprimer 
app.delete("/api/admin/categorie/:id", async (req, res) => {
    try {
        await db.query("DELETE FROM categories WHERE id_categorie = ?", [parseInt(req.params.id)]);
        res.json({ success: true });
    } catch (err) {
        res.status(500).json({ success: false, message: err.message });
    }
});


const PORT = 3000;
app.listen(PORT, () => {
    console.log(`  Serveur lancé sur http://localhost:${PORT}`);
});
