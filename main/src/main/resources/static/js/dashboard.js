async function initDashboard() {
  const response = await fetch('data.json');
  const dataStats = await response.json();

  // Update stat boxes
  $('#totalSaisies').text(dataStats.totalSaisies);
  $('#totalArrestations').text(dataStats.totalArrestations);
  $('#totalVoyages').text(dataStats.totalVoyages);
  $('#totalAlertes').text(dataStats.totalAlertes);

  // Chart.js
  new Chart(document.getElementById('saisiesChart'), {
    type: 'line',
    data: {
      labels: dataStats.labels,
      datasets: [{
        label: "Nombre de saisies",
        data: dataStats.saisiesMensuelles,
        borderColor: "rgba(75,192,192,1)",
        backgroundColor: "rgba(75,192,192,0.2)",
        borderWidth: 2,
        tension: 0.4,
        fill: true
      }]
    },
    options: { responsive: true, maintainAspectRatio: false }
  });

  // Leaflet Map
  const map = L.map('map').setView([28.0, 3.0], 5);
  L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 18
  }).addTo(map);

  dataStats.mapPoints.forEach(p => {
    L.marker([p.lat, p.lon])
      .addTo(map)
      .bindPopup(`<b>${p.name}</b><br>Saisies: ${p.qty}`);
  });
}

document.addEventListener("DOMContentLoaded", initDashboard);
