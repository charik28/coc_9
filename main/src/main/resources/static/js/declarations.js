
$(function () {
  /*  let declarations = [];
    let selectedId = null;

    // Charger les données
    $.getJSON("/js/fake-data.json", function (data) {
      declarations = data.map((d, i) => ({ id: i + 1, ...d }));
      initGrid(declarations);
    });

    function initGrid(data) {
      $("#operations-jsGrid").jsGrid({
        width: "100%",
        height: "500px",
        sorting: true,
        paging: true,
        autoload: true,
        data: data,
        fields: [
          { name: "id", title: "ID", type: "number", width: 30, align: "center" },
          { name: "type", title: "Type", type: "text", width: 80 },
          { name: "nom", title: "Nom", type: "text", width: 120 },
          { name: "nationalite", title: "Nationalité", type: "text", width: 80 },
          { name: "poste", title: "Poste", type: "text", width: 80 },
          { name: "montant", title: "Montant (DA)", type: "number", width: 70 },
          {
            type: "control",
            itemTemplate: function (_, item) {
              return $("<div>")
                .append(
                  $("<button>")
                    .addClass("btn btn-sm btn-info mr-1")
                    .html('<i class="fas fa-edit"></i>')
                    .click(() => editDeclaration(item))
                )
                .append(
                  $("<button>")
                    .addClass("btn btn-sm btn-danger")
                    .html('<i class="fas fa-trash"></i>')
                    .click(() => deleteDeclaration(item.id))
                );
            },
          },
        ],
      });
    }

    // Filtrage
    $("#applyFilter").click(function () {
      const nom = $("#filterNom").val().toLowerCase();
      const type = $("#filterType").val();
      const poste = $("#filterPoste").val().toLowerCase();

      const filtered = declarations.filter(
        (d) =>
          (!nom || d.nom.toLowerCase().includes(nom)) &&
          (!type || d.type === type) &&
          (!poste || d.poste.toLowerCase().includes(poste))
      );
      $("#operations-jsGrid").jsGrid("option", "data", filtered);
    });
  */

  // Ajouter ou modifier une déclaration
  $("#declarationForm").on("submit", function (e) {
    e.preventDefault();
    const formData = Object.fromEntries(new FormData(this).entries());

    if (formData.id) {
      const idx = declarations.findIndex((d) => d.id == formData.id);
      declarations[idx] = { ...formData, id: Number(formData.id) };
    } else {
      formData.id = declarations.length + 1;
      declarations.push(formData);
    }

    $("#operations-jsGrid").jsGrid("option", "data", declarations);
    $("#modalDeclaration").modal("hide");
    this.reset();
  });

  // Edit
  function editDeclaration(item) {
    selectedId = item.id;
    const form = $("#declarationForm")[0];
    Object.keys(item).forEach((k) => {
      if (form[k]) form[k].value = item[k];
    });
    $("#modalDeclaration").modal("show");
  }

  // Delete
  function deleteDeclaration(id) {
    if (!confirm("Supprimer cette déclaration ?")) return;
    declarations = declarations.filter((d) => d.id !== id);
    $("#operations-jsGrid").jsGrid("option", "data", declarations);
  }

  // Export Excel
  $("#exportExcel").on("click", function () {
    const csv = convertToCSV(declarations);
    downloadFile(csv, "declarations.csv", "text/csv");
  });

  // Export PDF
  $("#exportPDF").on("click", function () {
    const win = window.open("", "", "height=700,width=900");
    win.document.write("<html><head><title>Déclarations</title></head><body>");
    win.document.write("<h2>Liste des Déclarations</h2>");
    win.document.write("<table border='1' cellspacing='0' cellpadding='5'><tr><th>Type</th><th>Nom</th><th>Nationalité</th><th>Poste</th><th>Montant</th></tr>");
    declarations.forEach((d) =>
      win.document.write(`<tr><td>${d.type}</td><td>${d.nom}</td><td>${d.nationalite}</td><td>${d.poste}</td><td>${d.montant}</td></tr>`)
    );
    win.document.write("</table></body></html>");
    win.print();
  });

  function convertToCSV(objArray) {
    const array = [Object.keys(objArray[0])].concat(objArray);
    return array.map((it) => Object.values(it).join(",")).join("\n");
  }

  function downloadFile(content, fileName, mimeType) {
    const a = document.createElement("a");
    const blob = new Blob([content], { type: mimeType });
    a.href = URL.createObjectURL(blob);
    a.download = fileName;
    a.click();
  }
});
