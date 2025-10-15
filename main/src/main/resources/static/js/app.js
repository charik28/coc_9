// Fichier : app.js

function showSection(id) {
  ["dashboard", "declarations", "statistiques"].forEach(sec => {
    document.getElementById("section-" + sec).style.display = sec === id ? "block" : "none";
  });
  document.getElementById("pageTitle").innerText =
    id === "dashboard" ? "Tableau de Bord" :
      id === "declarations" ? "Déclarations" : "Statistiques";
}

function Inject_dashboard_stats() {
  // Inject dashboard stats
  let html = "";
  dashboardStats.forEach(stat => {
    html += `
      <div class="col-lg-3 col-6">
        <div class="small-box ${stat.color}">
          <div class="inner"><h3>${stat.value}</h3><p>${stat.label}</p></div>
          <div class="icon"><i class="${stat.icon}"></i></div>
        </div>
      </div>`;
  });
  $("#dashboardStats").html(html);

  // ChartJS
  new Chart($("#saisiesChart"), {
    type: "line",
    data: {
      labels: ["Jan", "Fév", "Mar", "Avr", "Mai", "Juin"],
      datasets: [{label: "Saisies (kg)", data: [12, 19, 3, 5, 2, 7], borderColor: "#007bff", fill: false}],
    },
  });
  new Chart($("#barChart"), {
    type: "bar",
    data: {
      labels: ["Nord", "Sud", "Est", "Ouest"],
      datasets: [{
        label: "Saisies",
        data: [100, 80, 50, 70],
        backgroundColor: ["#28a745", "#ffc107", "#17a2b8", "#dc3545"]
      }],
    },
  });
  new Chart($("#pieChart"), {
    type: "pie",
    data: {
      labels: ["Tabac", "Carburant", "Devises", "Autres"],
      datasets: [{data: [35, 25, 20, 20], backgroundColor: ["#007bff", "#28a745", "#ffc107", "#dc3545"]}],
    },
  });

/*
  // jsGrid
  $("#jsGrid").jsGrid({
    width: "100%",
    height: "400px",
    inserting: false,
    editing: false,
    sorting: true,
    paging: true,
    data: fakeDeclarations,
    fields: [
      { name: "voyageur", title: "Voyageur", type: "text", width: 70 },
      { name: "pays", title: "Pays", type: "text", width: 50 },
      { name: "poste", title: "Poste", type: "text", width: 50 },
      { name: "montant", title: "Montant (DZD)", type: "number", width: 50 },
    ],
  });
});*/

}
<!-- Fragment: Operations Dashboard -->
/*  $(function() {
    // Initialize Select2 with API
    $('.select2[data-api]').each(function () {
      const $el = $(this);
      fetch($el.data('api')).then(res => res.json()).then(data => {
        $el.append(data.map(opt => `<option value="${opt.id}">${opt.name || opt.nm}</option>`));
      });
    });
  }*/


async function loadContent(pageName) {
  const container = document.getElementById('homeContent');
  container.innerHTML = `
    <div class="text-center py-5 text-muted">
      <i class="fas fa-spinner fa-spin fa-2x"></i><br>
      Chargement du contenu...
    </div>
  `;

  try {
    const response = await fetch('/iframe/' + pageName);
    if (!response.ok) throw new Error("Erreur " + response.status);
    const html = await response.text();
    container.innerHTML = html;

    // Update title
    const titleMap = {
      'rendement-dashboard.html': 'Rendment bdd v2025',
      'dashboard.html': 'Tableau de Bord',
      'operations.html': 'Gestion des Opérations',
      'type_marchandises.html': 'Type de Marchandises',
      'declarations.html': 'Déclarations & Formulaires',
      'stats_maps.html': 'Statistiques - Cartes',
      'stats_charts.html': 'Statistiques - Graphiques'
    };
    document.getElementById('pageTitle').innerText = titleMap[pageName] || 'Anti-Contrebande';

    // Re-run any scripts inside the loaded HTML
    container.querySelectorAll("script").forEach(oldScript => {
      const newScript = document.createElement("script");
      newScript.text = oldScript.text;
      document.body.appendChild(newScript).remove();
    });

  } catch (err) {
    container.innerHTML = `<div class="alert alert-danger">Impossible de charger ${pageName}</div>`;
  }
}

// Load default dashboard on startup



