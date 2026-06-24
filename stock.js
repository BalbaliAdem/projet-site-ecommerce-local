/**
 * stock.js — Affichage du stock pour produits non-vêtements
 * Charge le stock depuis l'API et met à jour les cartes produits
 * Catégories gérées : Maison (salon, cuisine, décoration),
 *                     Gaming (consoles, PC, audio),
 *                     Téléphones & Accessoires (smartphones, montres, accessories)
 */

// Sous-catégories vêtements (gérées par Vetements.html avec variantes taille/couleur)
const CATS_VETEMENTS = [1, 2, 3, 4];

async function afficherStockProduits(sousCatId) {
  try {
    const res  = await fetch(`/api/produits/sous-categorie/${sousCatId}`);
    const data = await res.json();
    if (!data.success) return;

    data.produits.forEach(prod => {
      // Chercher la carte du produit via data-nom OU via le onclick (rétrocompatibilité)
      const cartes = document.querySelectorAll('.pc');
      cartes.forEach(carte => {
        // Méthode 1 : data-nom (standard recommandé)
        let nomCarte = (carte.dataset.nom || '').trim().toLowerCase();

        // Méthode 2 : extraire depuis onclick si data-nom absent
        if (!nomCarte) {
          const onclick = carte.getAttribute('onclick') || '';
          const m = onclick.match(/commander\s*\(\s*'([^']*)'/);
          if (m) nomCarte = m[1].trim().toLowerCase();
        }

        if (!nomCarte) return;
        if (nomCarte !== prod.nom_produit.trim().toLowerCase()) return;

        // Éviter les doublons
        if (carte.querySelector('.stock-produit')) return;

        // Badge stock
        const badgeHtml = creerBadgeStock(prod.quantite);
        const prix = carte.querySelector('p');
        if (prix) {
          prix.insertAdjacentHTML('afterend', badgeHtml);
        }

        // Marquer épuisé
        if (prod.quantite === 0) {
          carte.classList.add('out-of-stock');
          carte.style.opacity        = '0.7';
          carte.style.pointerEvents  = 'none';
          if (!carte.querySelector('.stock-overlay')) {
            const overlay = document.createElement('div');
            overlay.className = 'stock-overlay';
            overlay.style.cssText =
              'position:absolute;inset:0;background:rgba(255,255,255,.55);' +
              'display:flex;align-items:center;justify-content:center;' +
              'pointer-events:none;z-index:2;border-radius:inherit;';
            overlay.innerHTML =
              '<span style="background:#dc2626;color:#fff;font-size:11px;' +
              'font-weight:700;padding:4px 12px;border-radius:4px;' +
              'transform:rotate(-5deg);display:block;">ÉPUISÉ</span>';
            carte.style.position = 'relative';
            carte.appendChild(overlay);
          }
        } else {
          // Intercept le onclick pour décrémenter le stock au moment de commander
          const originalOnclick = carte.getAttribute('onclick');
          if (originalOnclick && !carte.dataset.stockHooked) {
            carte.dataset.stockHooked = '1';
            carte.setAttribute('onclick', '');
            carte.addEventListener('click', function(e) {
              // Décrémenter en BG (pas bloquant)
              fetch('/api/stock/decrementer-simple', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({
                  nom_produit: prod.nom_produit,
                  id_sous_categorie: sousCatId
                })
              }).catch(() => {});
              // Exécuter le onclick original
              // eslint-disable-next-line no-new-func
              const fn = new Function(originalOnclick);
              fn.call(carte);
            });
          }
        }
      });
    });
  } catch(e) {
    console.warn('Stock non disponible:', e.message);
  }
}

function creerBadgeStock(qte) {
  let cls, txt;
  if      (qte === 0)  { cls = 'epuise-badge'; txt = '⛔ Épuisé'; }
  else if (qte <= 3)   { cls = 'stock-bas';    txt = `⚠️ Plus que ${qte}`; }
  else if (qte <= 10)  { cls = 'stock-moyen';  txt = `📦 ${qte} en stock`; }
  else                 { cls = 'en-stock';      txt = '✅ En stock'; }
  return `<span class="stock-produit stock-badge ${cls}">${txt}</span>`;
}

// Styles inline (au cas où le CSS n'est pas encore chargé)
const styleStock = document.createElement('style');
styleStock.textContent = `
.stock-produit { display:inline-block;font-size:11px;font-weight:600;padding:2px 8px;border-radius:20px;margin:4px 0; }
.stock-produit.en-stock     { background:#dcfce7;color:#16a34a; }
.stock-produit.stock-moyen  { background:#dbeafe;color:#1d4ed8; }
.stock-produit.stock-bas    { background:#fef9c3;color:#a16207; }
.stock-produit.epuise-badge { background:#fee2e2;color:#dc2626; }
`;
document.head.appendChild(styleStock);
