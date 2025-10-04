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
