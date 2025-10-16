let mapStatesFul, heatmap, chart;

// 🧠 Simulated large dataset
function generateData(count = 500) {
  const data = [];
  const wilayas = ['Alger', 'Oran', 'Tlemcen', 'Tizi Ouzou', 'Annaba'];
  for (let i = 0; i < count; i++) {
    data.push({
      id: i+1,
      dr: 'DR' + (1 + i % 3),
      idd: 'IDD' + (1 + i % 5),
      wilaya: wilayas[i % wilayas.length],
      lat: 36 + Math.random(),
      lng: 2 + Math.random() * 3,
      kifKg: Math.random() * 100,
      carbL: Math.random() * 200,
      tabacKg: Math.random() * 50,
      armes: Math.floor(Math.random() * 5)
    });
  }
  return data;
}

const data = generateData(2000);

function initFilters() {
  const drs = [...new Set(data.map(d => d.dr))];
  const idds = [...new Set(data.map(d => d.idd))];
  const per = ['2025-01', '2025-02', '2025-03'];

  fillSelect('drSelect', drs);
  fillSelect('iddSelect', idds);
  fillSelect('periodeSelect', per);
}

function fillSelect(id, values) {
  const sel = document.getElementById(id);
  sel.innerHTML = '<option value="">Tous</option>' + values.map(v => `<option>${v}</option>`).join('');
}

function switchTab(tabId) {
  document.querySelectorAll('.tabBtn').forEach(b => b.classList.remove('active'));
  document.querySelectorAll('.tab-content').forEach(c => c.classList.remove('active'));
  document.querySelector(`.tabBtn[onclick*='${tabId}']`).classList.add('active');
  document.getElementById(tabId).classList.add('active');
}

function refreshData() {
  const dr = document.getElementById('drSelect').value;
  const idd = document.getElementById('iddSelect').value;

  const filtered = data.filter(d =>
    (!dr || d.dr === dr) &&
    (!idd || d.idd === idd)
  );
  renderChart(filtered);
  renderMap(filtered);
  renderHeat(filtered);
}

function renderChart(list) {
  const grouped = {};
  list.forEach(d => {
    if (!grouped[d.wilaya]) grouped[d.wilaya] = { kif: 0, carb: 0 };
    grouped[d.wilaya].kif += d.kifKg;
    grouped[d.wilaya].carb += d.carbL;
  });

  const labels = Object.keys(grouped);
  const kif = labels.map(l => grouped[l].kif);
  const carb = labels.map(l => grouped[l].carb);

  const ctx = document.getElementById('chartCanvas').getContext('2d');
  if (chart) chart.destroy();
  chart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels,
      datasets: [
        { label: 'Kif (Kg)', data: kif, backgroundColor: 'rgba(46, 204, 113,0.7)' },
        { label: 'Carburants (L)', data: carb, backgroundColor: 'rgba(52, 152, 219,0.7)' }
      ]
    }
  });
}

function renderMap(list) {
  if (!mapStatesFul) {
    mapStatesFul = L.map('map').setView([36.7, 3.0], 6);
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      maxZoom: 12
    }).addTo(mapStatesFul);
  } else {
    mapStatesFul.eachLayer(l => { if (l instanceof L.Marker) mapStatesFul.removeLayer(l); });
  }

  list.forEach(d => {
    const marker = L.marker([d.lat, d.lng]).addTo(mapStatesFul);
    marker.bindPopup(`<b>${d.wilaya}</b><br>Kif: ${d.kifKg.toFixed(1)} kg<br>
                          Carburant: ${d.carbL.toFixed(1)} L<br>
                          <a href="#" onclick="showDetails(${d.id});return false;">Détails</a>`);
  });
}

function renderHeat(list) {
  if (!heatmap) {
    heatmap = L.map('heat').setView([36.7, 3.0], 6);
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png').addTo(heatmap);
  }

  const pts = list.map(d => [d.lat, d.lng, d.kifKg / 100]);
  L.heatLayer(pts, { radius: 25 }).addTo(heatmap);
}

function showDetails(id) {
  const d = data.find(x => x.id === id);
  const div = document.getElementById('detailsContent');
  div.innerHTML = `
        <b>Wilaya:</b> ${d.wilaya}<br>
        <b>DR:</b> ${d.dr}<br>
        <b>IDD:</b> ${d.idd}<br>
        <b>Kif:</b> ${d.kifKg.toFixed(1)} kg<br>
        <b>Carburants:</b> ${d.carbL.toFixed(1)} L<br>
        <b>Armes:</b> ${d.armes}<br>
      `;
  document.getElementById('detailsModal').style.display = 'flex';
}
