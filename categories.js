
(function () {
  const CONFIG = window.CATS_CONFIG || {};
  const CONTENEUR_ID  = CONFIG.conteneur   || '#categories-container';
  const CARD_CLASS    = CONFIG.cardClass    || 'pc';
  const BASE_IMG      = CONFIG.baseImg      || './images/';

  // ── Injecter les styles si non déjà présents ──────────────
  if (!document.getElementById('cats-dyn-style')) {
    const st = document.createElement('style');
    st.id = 'cats-dyn-style';
    st.textContent = `
      .cats-section { margin: 2rem 0; }
      .cats-section-title {
        font-size: 1.1rem; font-weight: 700; color: #111827;
        margin-bottom: 1rem; display: flex; align-items: center; gap: 8px;
        padding-bottom: 8px; border-bottom: 2px solid #f3f4f6;
      }
      .cats-section-title i { color: #7c3aed; font-size: 1.3rem; }
      .cats-grid { display: flex; flex-wrap: wrap; gap: 1rem; margin-bottom: 1.5rem; }
      .cat-badge {
        display: inline-flex; align-items: center; gap: 6px;
        background: #f3e8ff; color: #7c3aed;
        padding: 6px 14px; border-radius: 20px;
        font-size: 0.82rem; font-weight: 600; cursor: pointer;
        border: 1.5px solid transparent; transition: all .2s;
        user-select: none;
      }
      .cat-badge:hover { background: #7c3aed; color: #fff; }
      .cat-badge.active { background: #7c3aed; color: #fff; border-color: #6d28d9; }

      .sous-cats { display: flex; flex-wrap: wrap; gap: 8px; margin-bottom: 1rem; }
      .sous-cat-btn {
        padding: 4px 12px; border-radius: 12px;
        background: #f9fafb; color: #6b7280;
        border: 1px solid #e5e7eb; font-size: 0.78rem;
        font-weight: 600; cursor: pointer; transition: all .2s;
      }
      .sous-cat-btn:hover  { background: #ede9fe; color: #7c3aed; border-color: #c4b5fd; }
      .sous-cat-btn.active { background: #ede9fe; color: #7c3aed; border-color: #7c3aed; }

      .produits-dynamiques { display: grid; grid-template-columns: repeat(auto-fill, minmax(180px,1fr)); gap: 1rem; }
      .prod-dyn-card {
        background: #fff; border-radius: 12px;
        box-shadow: 0 2px 8px rgba(0,0,0,.07);
        overflow: hidden; text-align: center;
        padding-bottom: 10px; transition: transform .2s, box-shadow .2s;
        cursor: pointer; position: relative;
      }
      .prod-dyn-card:hover { transform: translateY(-3px); box-shadow: 0 6px 20px rgba(0,0,0,.12); }
      .prod-dyn-card img {
        width: 100%; height: 160px; object-fit: cover;
        background: #f3f4f6;
      }
      .prod-dyn-card .prod-nom  { font-weight: 700; font-size: .85rem; color: #111827; margin: 8px 8px 2px; }
      .prod-dyn-card .prod-prix { font-size: .8rem; color: #7c3aed; font-weight: 700; margin-bottom: 6px; }
      .prod-dyn-card .prod-btn  {
        background: #7c3aed; color: #fff; border: none;
        border-radius: 8px; padding: 6px 14px;
        font-size: .78rem; font-weight: 600;
        cursor: pointer; margin-top: 4px;
        transition: background .2s;
      }
      .prod-dyn-card .prod-btn:hover { background: #6d28d9; }
      .prod-dyn-card.epuise { opacity: .65; }
      .prod-dyn-card.epuise .prod-btn { background: #9ca3af; cursor: not-allowed; }
      .badge-dyn-stock {
        display: inline-block; font-size: 10px; font-weight: 700;
        padding: 2px 8px; border-radius: 10px; margin: 3px 0;
      }
      .dyn-ok   { background: #dcfce7; color: #16a34a; }
      .dyn-bas  { background: #fef9c3; color: #a16207; }
      .dyn-zero { background: #fee2e2; color: #dc2626; }

      .cats-loading { text-align:center; padding: 2rem; color: #9ca3af; font-size:.9rem; }
      .cats-empty   { text-align:center; padding: 2rem; color: #d1d5db; }
    `;
    document.head.appendChild(st);
  }

  // Attendre le DOM
  document.addEventListener('DOMContentLoaded', () => {
    const conteneur = document.querySelector(CONTENEUR_ID);
    if (!conteneur) return; // page sans conteneur → on skip
    chargerCategories(conteneur);
  });

  // Charger catégories depuis l'API 
  async function chargerCategories(conteneur) {
    conteneur.innerHTML = '<div class="cats-loading">⏳ Chargement des catégories…</div>';
    try {
      const res  = await fetch('/api/categories');
      const data = await res.json();
      if (!data.success || !data.categories.length) {
        conteneur.innerHTML = '<div class="cats-empty">Aucune catégorie disponible.</div>';
        return;
      }
      afficherCategories(conteneur, data.categories);
    } catch (e) {
      conteneur.innerHTML = '<div class="cats-empty">⚠️ Impossible de charger les catégories.</div>';
      console.warn('[categories.js] Erreur réseau :', e.message);
    }
  }

  // Rendu HTML des catégories 
  function afficherCategories(conteneur, categories) {
    conteneur.innerHTML = '';

    categories.forEach(cat => {
      const section = document.createElement('div');
      section.className = 'cats-section';

      // Titre catégorie
      const titre = document.createElement('div');
      titre.className = 'cats-section-title';
      titre.innerHTML = `<i class="ti ${cat.icone || 'ti-tag'}"></i> ${cat.nom_categorie}`;
      section.appendChild(titre);

      // Boutons sous-catégories
      if (cat.sous_categories && cat.sous_categories.length) {
        const sousCatsDiv = document.createElement('div');
        sousCatsDiv.className = 'sous-cats';

        cat.sous_categories.forEach(sc => {
          const btn = document.createElement('button');
          btn.className = 'sous-cat-btn';
          btn.innerHTML = `<i class="ti ${sc.icone || 'ti-folder'}"></i> ${sc.nom_sous_categorie}`;
          btn.dataset.scId = sc.id_sous_categorie;
          btn.addEventListener('click', () => {
            // Toggle actif
            sousCatsDiv.querySelectorAll('.sous-cat-btn').forEach(b => b.classList.remove('active'));
            btn.classList.add('active');
            chargerProduitsSousCat(sc.id_sous_categorie, produitsDiv);
          });
          sousCatsDiv.appendChild(btn);
        });

        section.appendChild(sousCatsDiv);

        // Zone produits
        const produitsDiv = document.createElement('div');
        produitsDiv.className = 'produits-dynamiques';
        section.appendChild(produitsDiv);

        // Charger la première sous-catégorie par défaut
        const premier = sousCatsDiv.querySelector('.sous-cat-btn');
        if (premier) {
          premier.classList.add('active');
          chargerProduitsSousCat(cat.sous_categories[0].id_sous_categorie, produitsDiv);
        }
      }

      conteneur.appendChild(section);
    });
  }

  // Charger produits d'une sous-catégorie 
  async function chargerProduitsSousCat(idSousCat, zone) {
    zone.innerHTML = '<div class="cats-loading">Chargement…</div>';
    try {
      const res  = await fetch(`/api/produits/catalogue/${idSousCat}`);
      const data = await res.json();
      if (!data.success || !data.produits.length) {
        zone.innerHTML = '<div class="cats-empty">Aucun produit dans cette catégorie.</div>';
        return;
      }
      zone.innerHTML = '';
      data.produits.forEach(prod => zone.appendChild(creerCarteProduit(prod, idSousCat)));
    } catch (e) {
      zone.innerHTML = '<div class="cats-empty">⚠️ Erreur chargement produits.</div>';
    }
  }

  // Créer une carte produit 
  function creerCarteProduit(prod, idSousCat) {
    const card = document.createElement('div');
    card.className = `prod-dyn-card ${CARD_CLASS}${prod.quantite === 0 ? ' epuise' : ''}`;
    card.dataset.nom  = prod.nom_produit;
    card.dataset.prix = prod.prix;

    let badgeCls = 'dyn-ok', badgeTxt = '✅ En stock';
    if      (prod.quantite === 0) { badgeCls = 'dyn-zero'; badgeTxt = '⛔ Épuisé'; }
    else if (prod.quantite <= 3)  { badgeCls = 'dyn-bas';  badgeTxt = `⚠️ Plus que ${prod.quantite}`; }
    else if (prod.quantite <= 10) { badgeCls = 'dyn-bas';  badgeTxt = `📦 ${prod.quantite} en stock`; }

    const imgSrc = prod.image_url || `${BASE_IMG}placeholder.jpg`;

    card.innerHTML = `
      <img src="${imgSrc}" alt="${prod.nom_produit}"
           onerror="this.src='${BASE_IMG}placeholder.jpg'">
      <div class="prod-nom">${prod.nom_produit}</div>
      <div class="prod-prix">$${parseFloat(prod.prix).toFixed(2)}</div>
      <span class="badge-dyn-stock ${badgeCls}">${badgeTxt}</span><br>
      <button class="prod-btn" ${prod.quantite === 0 ? 'disabled' : ''}
        onclick="event.stopPropagation();
          if(typeof commander==='function'){
            commander('${prod.nom_produit}','${prod.prix}','${imgSrc}');
            fetch('/api/stock/decrementer-simple',{
              method:'POST',headers:{'Content-Type':'application/json'},
              body:JSON.stringify({nom_produit:'${prod.nom_produit}',id_sous_categorie:${idSousCat}})
            }).catch(()=>{});
          }">
        ${prod.quantite === 0 ? 'Épuisé' : '🛒 Commander'}
      </button>
    `;
    return card;
  }

})();
