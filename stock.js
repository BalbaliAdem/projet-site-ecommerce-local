

// Sous-catégories vêtements (gérées par Vetements.html avec variantes)
const CATS_VETEMENTS = [1, 2, 3, 4];

async function afficherStockProduits(sousCatId) {
  try {
    const res = await fetch(`/api/produits/sous-categorie/${sousCatId}`);
    const data = await res.json();
    if (!data.success) return;

    data.produits.forEach(prod => {
      // Chercher la carte du produit via son nom dans le onclick
      const cartes = document.querySelectorAll('.pc');
      cartes.forEach(carte => {
        const onclick = carte.getAttribute('onclick') || '';
        const nomMatch = onclick.match(/commander\s*\(\s*'([^']*)'/);
        if (!nomMatch) return;
        const nom = nomMatch[1];
        if (nom.toLowerCase() !== prod.nom_produit.toLowerCase()) return;

        // Badge stock
        const badge = creerBadgeStock(prod.quantite);
        // Insérer après le prix
        const prix = carte.querySelector('p');
        if (prix && !carte.querySelector('.stock-produit')) {
          prix.insertAdjacentHTML('afterend', badge);
        }

        // Marquer épuisé
        if (prod.quantite === 0) {
          carte.classList.add('out-of-stock');
          carte.style.opacity = '0.7';
          carte.style.pointerEvents = 'none';
          const overlay = document.createElement('div');
          overlay.style.cssText = 'position:absolute;inset:0;background:rgba(255,255,255,.55);display:flex;align-items:center;justify-content:center;pointer-events:none;z-index:2;border-radius:inherit;';
          overlay.innerHTML = '<span style="background:#dc2626;color:#fff;font-size:11px;font-weight:700;padding:4px 12px;border-radius:4px;transform:rotate(-5deg);display:block;">ÉPUISÉ</span>';
          carte.style.position = 'relative';
          carte.appendChild(overlay);
        }
      });
    });
  } catch(e) {
    console.warn('Stock non disponible:', e.message);
  }
}

function creerBadgeStock(qte) {
  let cls, txt;
  if (qte === 0)     { cls = 'epuise-badge';  txt = '⛔ Épuisé'; }
  else if (qte <= 3) { cls = 'stock-bas';     txt = `⚠️ Plus que ${qte}`; }
  else if (qte <= 10){ cls = 'stock-moyen';   txt = `📦 ${qte} en stock`; }
  else               { cls = 'en-stock';      txt = '✅ En stock'; }
  return `<span class="stock-produit stock-badge ${cls}">${txt}</span>`;
}

// Styles inline si CSS pas encore chargé
const styleStock = document.createElement('style');
styleStock.textContent = `
.stock-produit { display:inline-block;font-size:11px;font-weight:600;padding:2px 8px;border-radius:20px;margin:4px 0; }
.stock-produit.en-stock    { background:#dcfce7;color:#16a34a; }
.stock-produit.stock-moyen { background:#dbeafe;color:#1d4ed8; }
.stock-produit.stock-bas   { background:#fef9c3;color:#a16207; }
.stock-produit.epuise-badge{ background:#fee2e2;color:#dc2626; }
`;
document.head.appendChild(styleStock);
