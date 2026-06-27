

(function() {
  // Récupérer l'id de sous-catégorie depuis l'attribut du script
  const scriptTag   = document.currentScript;
  const sousCatId   = scriptTag ? scriptTag.getAttribute('data-sous-cat') : null;
  if (!sousCatId) return;

  const COULEUR_CSS = {
    'Noir':'#1f2937','Blanc':'#f1f5f9','Gris':'#9ca3af',
    'Bleu':'#3b82f6','Rouge':'#ef4444','Vert':'#22c55e',
    'Marron':'#92400e','Rose':'#f472b6','Beige':'#d4a17a',
    'Jaune':'#facc15','Violet':'#a855f7','Orange':'#f97316',
    'Standard':'#e5e7eb'
  };

  // ── CSS dynamique ──
  const style = document.createElement('style');
  style.textContent = `
    .badge-stock{display:inline-block;font-size:11px;font-weight:600;padding:2px 8px;border-radius:20px;margin:5px 0 2px;}
    .s-ok{background:#dcfce7;color:#16a34a;}.s-bas{background:#fef9c3;color:#a16207;}.s-zero{background:#fee2e2;color:#dc2626;}
    .tailles{display:flex;flex-wrap:wrap;gap:5px;margin:6px 0;}
    .btn-taille{min-width:34px;height:30px;padding:0 7px;border:1.5px solid #d1d5db;border-radius:6px;background:#fff;font-size:12px;font-weight:600;cursor:pointer;color:#374151;transition:.15s;}
    .btn-taille:hover:not(.epuise){border-color:#6366f1;color:#6366f1;}.btn-taille.selected{background:#6366f1;border-color:#6366f1;color:#fff;}
    .btn-taille.epuise{background:#f3f4f6;color:#ccc;border-color:#e5e7eb;cursor:not-allowed;text-decoration:line-through;}
    .couleurs{display:flex;flex-wrap:wrap;gap:5px;margin:4px 0 8px;}
    .btn-couleur{width:22px;height:22px;border-radius:50%;border:2px solid transparent;cursor:pointer;transition:.15s;position:relative;}
    .btn-couleur:hover:not(.epuise){transform:scale(1.2);}.btn-couleur.selected{border-color:#6366f1;transform:scale(1.15);}
    .btn-couleur.epuise{opacity:.3;cursor:not-allowed;}
    .lbl{font-size:10px;font-weight:700;color:#9ca3af;text-transform:uppercase;letter-spacing:.4px;}
    .sel-info{font-size:11px;min-height:16px;margin:3px 0 6px;color:#6b7280;}
    .sel-info.ok{color:#16a34a;font-weight:600;}.sel-info.warn{color:#d97706;font-weight:600;}.sel-info.err{color:#dc2626;font-weight:600;}
    .pc.tout-epuise{opacity:.65;pointer-events:none;}.pc.tout-epuise .pc-actions{display:none;}
    .epuise-banner{position:absolute;top:10px;right:-8px;background:#dc2626;color:#fff;font-size:10px;font-weight:700;padding:3px 10px;border-radius:4px;transform:rotate(3deg);box-shadow:0 2px 6px rgba(220,38,38,.35);z-index:3;}
    .pc{position:relative;}
    .stock-detail{display:none;align-items:center;gap:5px;font-size:12px;font-weight:700;padding:4px 12px;border-radius:20px;margin:4px 0 6px;}
    .stock-detail.visible{display:inline-flex;}.sd-ok{background:#dcfce7;color:#16a34a;}.sd-bas{background:#fef9c3;color:#a16207;}.sd-zero{background:#fee2e2;color:#dc2626;}
    .pc.active-card{outline:2px solid #6366f1;box-shadow:0 0 0 4px rgba(99,102,241,.12);}
    .nouveaux-produits-titre{grid-column:1/-1;font-size:1rem;font-weight:700;color:#374151;padding:12px 0 4px;border-top:1.5px dashed #e5e7eb;margin-top:8px;}
  `;
  document.head.appendChild(style);

  function getGrille() {
    return document.querySelector('#grille-produits') || document.querySelector('.produits-grid');
  }

  // ── Carte vêtement avec taille/couleur ──
  function rendreCarte_Vetement(grille, prod) {
    const id       = prod.id;
    const nom      = prod.nom;
    const prix     = prod.prix;
    const img      = prod.image;
    const variantes = prod.variantes || [];
    const totalStock = variantes.reduce((s,v) => s + v.quantite, 0);

    const carte = document.createElement('div');
    carte.className = 'pc dyn-produit';
    carte.dataset.id  = id;
    carte.dataset.nom  = nom;
    carte.dataset.prix = prix;
    carte.dataset.img  = img;

    let badgeHtml = '';
    if (totalStock === 0)     badgeHtml = '<span class="badge-stock s-zero">⛔ Épuisé</span>';
    else if (totalStock <= 5) badgeHtml = `<span class="badge-stock s-bas">⚠️ Plus que ${totalStock}</span>`;
    else                      badgeHtml = '<span class="badge-stock s-ok">✅ En stock</span>';

    carte.innerHTML = `
      <img src="${img}" alt="${nom}" onerror="this.src='./images/produit.jpg'" style="width:100%;aspect-ratio:1;object-fit:cover;border-radius:8px;">
      <h3>${nom}</h3>
      <p>$${prix}</p>
      ${badgeHtml}
    `;

    if (totalStock === 0) {
      carte.classList.add('tout-epuise');
      carte.insertAdjacentHTML('beforeend','<span class="epuise-banner">ÉPUISÉ</span>');
      grille.appendChild(carte);
      return;
    }

    const tailles  = [...new Set(variantes.map(v => v.taille))];
    const couleurs = [...new Set(variantes.map(v => v.couleur))];

    const sel = document.createElement('div');
    sel.className = 'variante-sel';
    sel.innerHTML = `
      <div class="lbl">Taille</div>
      <div class="tailles">
        ${tailles.map(t => {
          const stk = variantes.filter(v => v.taille===t).reduce((s,v)=>s+v.quantite,0);
          return `<button class="btn-taille${stk===0?' epuise':''}" data-t="${t}">${t}</button>`;
        }).join('')}
      </div>
      <div class="lbl">Couleur</div>
      <div class="couleurs">
        ${couleurs.map(c => {
          const stk = variantes.filter(v => v.couleur===c).reduce((s,v)=>s+v.quantite,0);
          const bg  = COULEUR_CSS[c]||'#e5e7eb';
          const brd = c==='Blanc'?'outline:1.5px solid #d1d5db;':'';
          return `<span class="btn-couleur${stk===0?' epuise':''}" data-c="${c}" title="${c}" style="background:${bg};${brd}"></span>`;
        }).join('')}
      </div>
      <div class="sel-info" id="dyn-info-${id}"></div>
      <div class="pc-actions">
        <button class="btn-panier btn-panier-active" onclick="event.stopPropagation();dynAjouterVariante('${id}','${nom}','${prix}','${img}',false)">
          <i class="ti ti-shopping-cart-plus"></i> Panier
        </button>
        <button class="btn-commander-direct" onclick="event.stopPropagation();dynAjouterVariante('${id}','${nom}','${prix}','${img}',true)">
          <i class="ti ti-bolt"></i> Acheter
        </button>
      </div>`;

    carte.appendChild(sel);

    let selT = null, selC = null;

    function majInfo() {
      const el = document.getElementById('dyn-info-'+id);
      if (!el) return;
      if (!selT && !selC) { el.textContent=''; el.className='sel-info'; return; }
      if (!selT) { el.textContent='Choisir une taille'; el.className='sel-info'; return; }
      if (!selC) { el.textContent='Choisir une couleur'; el.className='sel-info'; return; }
      const v = variantes.find(x => x.taille===selT && x.couleur===selC);
      if (!v || v.quantite===0) { el.textContent='⛔ Épuisé pour cette combinaison'; el.className='sel-info err'; }
      else if (v.quantite<=3)   { el.textContent=`⚠️ Plus que ${v.quantite} disponible`; el.className='sel-info warn'; }
      else                      { el.textContent=`✅ ${v.quantite} en stock`; el.className='sel-info ok'; }
    }

    sel.querySelectorAll('.btn-taille:not(.epuise)').forEach(b => {
      b.addEventListener('click', e => {
        e.stopPropagation();
        sel.querySelectorAll('.btn-taille').forEach(x => x.classList.remove('selected'));
        b.classList.add('selected'); selT = b.dataset.t;
        sel.querySelectorAll('.btn-couleur').forEach(bc => {
          const v = variantes.find(x => x.taille===selT && x.couleur===bc.dataset.c);
          bc.classList.toggle('epuise', !v || v.quantite===0);
        });
        majInfo();
      });
    });

    sel.querySelectorAll('.btn-couleur:not(.epuise)').forEach(b => {
      b.addEventListener('click', e => {
        e.stopPropagation();
        sel.querySelectorAll('.btn-couleur').forEach(x => x.classList.remove('selected'));
        b.classList.add('selected'); selC = b.dataset.c;
        majInfo();
      });
    });

    carte._getSelection = () => ({ selT, selC, variantes });
    grille.appendChild(carte);
  }

  // ── Carte produit simple ──
  function rendreCarte_Simple(grille, prod) {
    const id   = prod.id;
    const nom  = prod.nom;
    const prix = prod.prix;
    const img  = prod.image;
    const qte  = prod.quantite;

    const carte = document.createElement('div');
    carte.className = 'pc dyn-produit';
    carte.dataset.id   = id;
    carte.dataset.nom  = nom;
    carte.dataset.prix = prix;
    carte.dataset.img  = img;

    let badgeHtml = '';
    if (qte === 0)     badgeHtml = '<span class="badge-stock s-zero">⛔ Épuisé</span>';
    else if (qte <= 5) badgeHtml = `<span class="badge-stock s-bas">⚠️ Plus que ${qte}</span>`;
    else               badgeHtml = '<span class="badge-stock s-ok">✅ En stock</span>';

    let sdClass = qte===0?'sd-zero':qte<=5?'sd-bas':'sd-ok';
    let sdTxt   = qte===0?'⛔ Épuisé':`✅ ${qte} en stock`;

    carte.innerHTML = `
      <img src="${img}" alt="${nom}" onerror="this.src='./images/produit.jpg'" style="width:100%;aspect-ratio:1;object-fit:cover;border-radius:8px;">
      <h3>${nom}</h3>
      <p>$${prix}</p>
      ${badgeHtml}
      <div class="stock-detail ${sdClass}" id="dyn-sd-${id}">${sdTxt}</div>
      <div class="pc-actions">
        <button class="btn-panier btn-panier-active"
          onclick="event.stopPropagation(); dynAjouterAuPanierPC('${id}','${nom}','${prix}','${img}')">
          <i class="ti ti-shopping-cart-plus"></i> Panier
        </button>
        <button class="btn-commander-direct"
          onclick="event.stopPropagation(); dynCommanderPC('${id}','${nom}','${prix}','${img}')">
          <i class="ti ti-bolt"></i> Acheter
        </button>
      </div>
    `;

    if (qte === 0) {
      carte.classList.add('tout-epuise');
      carte.insertAdjacentHTML('beforeend','<span class="epuise-banner">ÉPUISÉ</span>');
    }

    carte.addEventListener('click', e => {
      if (e.target.closest('button')) return;
      const estActive = carte.classList.contains('active-card');
      document.querySelectorAll('.pc.active-card').forEach(c => {
        c.classList.remove('active-card');
        const sd = c.querySelector('.stock-detail');
        if (sd) sd.classList.remove('visible');
      });
      if (!estActive) {
        carte.classList.add('active-card');
        const sd = carte.querySelector('.stock-detail');
        if (sd) sd.classList.add('visible');
      }
    });

    grille.appendChild(carte);
  }

  function majAffichageStock(carte, nouvelleQte) {
    const bg = carte.querySelector('.badge-stock');
    if (bg) {
      if (nouvelleQte === 0)      { bg.className='badge-stock s-zero'; bg.textContent='⛔ Épuisé'; }
      else if (nouvelleQte <= 5)  { bg.className='badge-stock s-bas';  bg.textContent=`⚠️ Plus que ${nouvelleQte}`; }
      else                        { bg.className='badge-stock s-ok';   bg.textContent='✅ En stock'; }
    }
    if (nouvelleQte === 0) {
      carte.classList.add('tout-epuise');
      carte.style.pointerEvents = 'none';
      carte.insertAdjacentHTML('beforeend','<span class="epuise-banner">ÉPUISÉ</span>');
      const actions = carte.querySelector('.pc-actions');
      if (actions) actions.style.display = 'none';
    }
  }

  // ── Fonctions globales (appelées par onclick) ──
  window.dynAjouterVariante = function(id, nom, prix, img, acheter) {
    const carte = document.querySelector(`.pc[data-id="${id}"]`);
    if (!carte || !carte._getSelection) return;
    const { selT, selC, variantes } = carte._getSelection();
    if (!selT || !selC) {
      const el = document.getElementById('dyn-info-'+id);
      if (el) { el.textContent='⚠️ Choisir une taille et une couleur'; el.className='sel-info err'; }
      return;
    }
    const v = variantes.find(x => x.taille===selT && x.couleur===selC);
    if (!v || v.quantite===0) {
      const el = document.getElementById('dyn-info-'+id);
      if (el) { el.textContent='⛔ Épuisé pour cette combinaison'; el.className='sel-info err'; }
      return;
    }
    fetch('/api/stock/decrementer', {
      method:'POST', headers:{'Content-Type':'application/json'},
      body: JSON.stringify({ id_variante: v.id_variante })
    });
    const nomComplet = `${nom} - Taille ${selT} / ${selC}`;
    if (acheter) commander(nomComplet, prix, img);
    else         ajouterAuPanier(nomComplet, prix, img);
  };

  window.dynCommanderPC = async function(id, nom, prix, img) {
    const carte = document.querySelector(`.pc[data-id="${id}"]`);
    await fetch('/api/produit/'+id+'/decrementer', { method:'POST', headers:{'Content-Type':'application/json'} });
    try {
      const r = await fetch(`/api/produit/${id}/stock`);
      const d = await r.json();
      if (d.success && carte) majAffichageStock(carte, d.quantite);
    } catch(e) {}
    commander(nom, prix, img);
  };

  window.dynAjouterAuPanierPC = async function(id, nom, prix, img) {
    const carte = document.querySelector(`.pc[data-id="${id}"]`);
    await fetch('/api/produit/'+id+'/decrementer', { method:'POST', headers:{'Content-Type':'application/json'} });
    try {
      const r = await fetch(`/api/produit/${id}/stock`);
      const d = await r.json();
      if (d.success && carte) majAffichageStock(carte, d.quantite);
    } catch(e) {}
    ajouterAuPanier(nom, prix, img);
  };

  // ── Chargement principal ──
  async function charger() {
    const grille = getGrille();
    if (!grille) return;

    try {
      const res  = await fetch(`/api/produits/catalogue/${sousCatId}`);
      const data = await res.json();
      if (!data.success || data.produits.length === 0) return;

      // Noms des produits déjà affichés (statiques)
      const nomsExistants = new Set(
        [...grille.querySelectorAll('.pc[data-nom]')].map(c => c.dataset.nom.toLowerCase().trim())
      );

      const nouveaux = data.produits.filter(p => !nomsExistants.has(p.nom.toLowerCase().trim()));
      if (nouveaux.length === 0) return;

      // Séparateur visuel
      const sep = document.createElement('div');
      sep.className = 'nouveaux-produits-titre';
      sep.textContent = '✨ Nouveaux produits';
      grille.appendChild(sep);

      for (const prod of nouveaux) {
        if (prod.est_vetement) {
          rendreCarte_Vetement(grille, prod);
        } else {
          rendreCarte_Simple(grille, prod);
        }
      }
    } catch(e) {
      console.warn('[produits-dynamiques] Erreur:', e.message);
    }
  }

  // Attendre que le DOM soit prêt
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', charger);
  } else {
    charger();
  }
})();
