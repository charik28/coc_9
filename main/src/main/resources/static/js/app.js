// Fichier : app.js

function showSection(id) {
  ["dashboard", "declarations", "statistiques"].forEach(sec => {
    document.getElementById("section-" + sec).style.display = sec === id ? "block" : "none";
  });
  document.getElementById("pageTitle").innerText =
    id === "dashboard" ? "Tableau de Bord" :
      id === "declarations" ? "Déclarations" : "Statistiques";
}

$(function () {
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
      datasets: [{ label: "Saisies (kg)", data: [12, 19, 3, 5, 2, 7], borderColor: "#007bff", fill: false }],
    },
  });
  new Chart($("#barChart"), {
    type: "bar",
    data: {
      labels: ["Nord", "Sud", "Est", "Ouest"],
      datasets: [{ label: "Saisies", data: [100, 80, 50, 70], backgroundColor: ["#28a745", "#ffc107", "#17a2b8", "#dc3545"] }],
    },
  });
  new Chart($("#pieChart"), {
    type: "pie",
    data: {
      labels: ["Tabac", "Carburant", "Devises", "Autres"],
      datasets: [{ data: [35, 25, 20, 20], backgroundColor: ["#007bff", "#28a745", "#ffc107", "#dc3545"] }],
    },
  });

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
});

// Form handler
$("#formDeclaration").on("submit", function (e) {
  e.preventDefault();
  const item = {
    id: fakeDeclarations.length + 1,
    voyageur: $("#nomVoyageur").val(),
    pays: $("#paysOrigine").val(),
    poste: $("#poste").val(),
    montant: parseFloat($("#montant").val()) || 0,
  };
  fakeDeclarations.push(item);
  $("#jsGrid").jsGrid("option", "data", fakeDeclarations);
  this.reset();
});

// Export simulation
function exportToExcel() { alert("Export Excel simulé ✅"); }
function exportToPDF() { alert("Export PDF simulé ✅"); }


<!-- Fragment: Operations Dashboard -->
  $(function() {
  // Initialize Select2 with API
  $('.select2[data-api]').each(function() {
    const $el = $(this);
    fetch($el.data('api')).then(res => res.json()).then(data => {
      $el.append(data.map(opt => `<option value="${opt.id}">${opt.name || opt.nm}</option>`));
    });
  });

  // Initialize jsGrid
  $("#jsGrid-operations").jsGrid({
  width: "100%",
  height: "400px",
  paging: true,
  autoload: true,
  controller: {
  loadData: function() {
  return fetch('/api/operation/grid').then(res => res.json());
}
},
    //id,mois,annee,dr,idd,nm ,wilaya,collaboration
  fields: [
{ name: "id", title: "id", type: "text", width: 20 },
{ name: "mois", title: "Mois", type: "text", width: 70 },
{ name: "annee", title: "Année", type: "text", width: 70 },
{ name: "dr", title: "DR", type: "text", width: 70 },
{ name: "idd", title: "IDD", type: "text", width: 70 },
{ name: "nm", title: "Brigade", type: "text", width: 70 },
{ name: "wilaya", title: "Wilaya", type: "text", width: 70 },

{ name: "marchandiseNm", title: "Marchandise", type: "text", width: 100 },
{ name: "quantite", title: "Quantité", type: "number", width: 60 },
{ name: "unite", title: "Unité", type: "text", width: 50 },
  ]
});

  // Initialize Map (Leaflet)
  const map = L.map('map-operations').setView([36.75, 3.05], 6);
  L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
  attribution: '&copy; OSM'
}).addTo(map);

  // Initialize Charts
  new Chart(document.getElementById('chart-quantite'), {
  type: 'bar',
  data: {
  labels: ["Cocaïne", "Armes", "Tabac", "Fuel"],
  datasets: [{ label: "Quantité", data: [30, 12, 54, 20] }]
}
});

  new Chart(document.getElementById('chart-categories'), {
  type: 'pie',
  data: {
  labels: ["Narcotiques", "Contrebande", "Devises", "Armes"],
  datasets: [{ data: [35, 25, 20, 20] }]
}
});
});


// Activate treeview for current section
$('.nav-sidebar a').on('click', function() {
  $('.nav-sidebar a').removeClass('active');
  $(this).addClass('active');
});


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
      'dashboard.html': 'Tableau de Bord',
      'operations.html': 'Gestion des Opérations',
      'type_marchandises.html': 'Type de Marchandises',
      'declarations.html': 'Déclarations & Formulaires',
      'stats_cartes.html': 'Statistiques - Cartes',
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
document.addEventListener("DOMContentLoaded", function() {
  loadContent("dashboard.html");
});
