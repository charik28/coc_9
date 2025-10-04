// Fichier : data.js

const fakeDeclarations = [
  { id: 1, voyageur: "Ali Ben Salah", pays: "Tunisie", poste: "El Kala", montant: 12000 },
  { id: 2, voyageur: "Mounir Haddad", pays: "Libye", poste: "Debdeb", montant: 5000 },
  { id: 3, voyageur: "Sarah Lounis", pays: "France", poste: "Aéroport Alger", montant: 90000 },
];

const dashboardStats = [
  { id: "totalSaisies", label: "Saisies Totales", value: 245, color: "bg-info", icon: "fas fa-boxes" },
  { id: "totalArrestations", label: "Arrestations", value: 37, color: "bg-success", icon: "fas fa-user-shield" },
  { id: "totalVoyages", label: "Voyages Contrôlés", value: 122, color: "bg-warning", icon: "fas fa-plane" },
  { id: "totalAlertes", label: "Alertes", value: 8, color: "bg-danger", icon: "fas fa-exclamation-triangle" },
];
