const apiBase = '/api/stats'; // adjust to your StatsResource path

async function initRendmentLayout()  {
  await initMap('rendementMap');
  await loadFilters();
  await refreshData();
  document.getElementById("applyFilter").addEventListener("click", refreshData);
}

let map;
function initMap0() {

  map = L.map('rendementMap').setView([28, 3], 5); // Algeria center
  L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
    attribution: '&copy; OpenStreetMap contributors'
  }).addTo(map);
}

async function loadFilters() {
  const res = await fetch(`${apiBase}/filters`);
  const data = await res.json();
  const drSel = document.getElementById('drFilter');
  const iddSel = document.getElementById('iddFilter');
  data.forEach(f => {
    if (!Array.from(drSel.options).some(o => o.value === f.dr))
      drSel.innerHTML += `<option value="${f.dr}">${f.dr}</option>`;
    if (!Array.from(iddSel.options).some(o => o.value === f.idd))
      iddSel.innerHTML += `<option value="${f.idd}">${f.idd}</option>`;
  });
}

async function refreshData() {
  const params = new URLSearchParams({
    dr: document.getElementById('drFilter').value,
    idd: document.getElementById('iddFilter').value,
    month: document.getElementById('monthFilter').value
  });

  // Fetch map data
  const mapRes = await fetch(`${apiBase}/map?${params}`);
  const mapData = await mapRes.json();
  updateMap(mapData);

  // Fetch chart data
  const chartRes = await fetch(`${apiBase}/chart?${params}`);
  const chartData = await chartRes.json();
  updateChart(chartData);

  updateSummary(chartData);
}

function updateMap(points) {
  map.eachLayer(l => { if (l instanceof L.Marker) map.removeLayer(l); });
  points.forEach(p => {
    if (p.latitude && p.longitude)
      L.marker([p.latitude, p.longitude]).addTo(map)
        .bindPopup(`<b>${p.dr} / ${p.brigade}</b><br>${p.date}<br>Kif: ${p.kifKg || 0} kg`);
  });
}

let chartInstance;
function updateChart(data) {
  const ctx = document.getElementById('rendementChart');
  const labels = data.map(d => `${d.annee}-${String(d.mois).padStart(2,'0')}`);
  const kif = data.map(d => d.totalKif);
  const coc = data.map(d => d.totalCoc);
  const psy = data.map(d => d.totalPsy);
  const carb = data.map(d => d.totalCarb);

  if (chartInstance) chartInstance.destroy();
  chartInstance = new Chart(ctx, {
    type: 'line',
    data: {
      labels,
      datasets: [
        { label: 'Kif (kg)', data: kif, borderWidth: 2 },
        { label: 'Cocaïne (kg)', data: coc, borderWidth: 2 },
        { label: 'Psychotropes', data: psy, borderWidth: 2 },
        { label: 'Carburants (L)', data: carb, borderWidth: 2 }
      ]
    }
  });
}

function updateSummary(data) {
  let sum = (key) => data.reduce((a,b)=>a+(b[key]||0),0);
  document.getElementById('sumKif').innerText = sum('totalKif').toFixed(1);
  document.getElementById('sumCoc').innerText = sum('totalCoc').toFixed(1);
  document.getElementById('sumPsy').innerText = sum('totalPsy');
  document.getElementById('sumCarb').innerText = sum('totalCarb').toFixed(1);
}
