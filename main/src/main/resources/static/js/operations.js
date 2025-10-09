$(function () {
  // Initialize map
/*
  const map = L.map("map-operations").setView([28.0, 2.0], 5);
  L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
    attribution: "© OpenStreetMap contributors",
  }).addTo(map);
*/

  // Fetch operations from backend API
  $.getJSON("/api/operation/grid", function (data) {
    initJsGrid(data);
    plotOperations(data);
  });

  // Initialize jsGrid
  function initJsGrid(data) {
    $("#jsGrid-operations").jsGrid({
      width: "100%",
      height: "400px",
      inserting: false,
      editing: false,
      sorting: true,
      paging: true,
      filtering: true,
      autoload: true,
      data: data,
      fields: [
        { name: "id", type: "text", title: "ID", width: 50 },
        { name: "orgn.orgnNm", type: "text", title: "Organisation" },
        { name: "collaborationType", type: "text", title: "Collaboration" },
        { name: "marchandie.nom", type: "text", title: "Marchandise" },
        { name: "quantite", type: "text", title: "Quantité" },
        { name: "unite", type: "text", title: "Unité" },
        { name: "date", type: "text", title: "Date" },
        { name: "time", type: "text", title: "Heure" },
        {
          name: "path",
          title: "Position",
          itemTemplate: function (val) {
            if (!val || val.length === 0) return "—";
            const pt = val[0];
            return `${pt.latitude.toFixed(3)}, ${pt.longitude.toFixed(3)}`;
          },
        },
      ],
    });
  }

  // Plot operations on Leaflet
  function plotOperations(data) {
    data.forEach((op) => {
      if (op.path && op.path.length > 0) {
        const first = op.path[0];
        const marker = L.marker([first.latitude, first.longitude]).addTo(map);
        marker.bindPopup(
          `<b>${op.marchandie.nom || "Marchandise inconnue"}</b><br/>
          ${op.orgn?.orgnNm || "Organe inconnu"}<br/>
          Quantité: ${op.quantite || "-"} ${op.unite || ""}<br/>
          Date: ${op.date || "-"}`
        );

        if (op.path.length > 1) {
          const polyline = L.polyline(
            op.path.map((p) => [p.latitude, p.longitude]),
            { color: "red", weight: 2 }
          ).addTo(map);
          map.fitBounds(polyline.getBounds(), { padding: [20, 20] });
        }
      }
    });
  }

  // Export Excel & PDF
  $("#exportExcel").click(() => exportGrid("excel"));
  $("#exportPdf").click(() => exportGrid("pdf"));

  function exportGrid(type) {
    const data = $("#jsGrid").jsGrid("option", "data");
    const blob = new Blob([JSON.stringify(data, null, 2)], {
      type: "application/json",
    });
    const url = URL.createObjectURL(blob);
    const a = document.createElement("a");
    a.href = url;
    a.download = `operations_${type}.json`;
    a.click();
  }
});
