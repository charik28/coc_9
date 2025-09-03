
function initjsGridAdherents(){

  console.debug('initing jsGrid::')
  $("#jsGridAdherents").jsGrid({
  width: "95%",
  height: "400px",

  inserting: false,
  editing: true,
  sorting: true,
  paging: true,
  autoload: true,

  controller: {
  loadData: function() {
  // fetch from backend API
  return $.ajax({
  type: "GET",
  url: server2Url+"adherents",
  dataType: "json"
});
},
  updateItem: function(item) {
  return $.ajax({
  type: "PUT",
  url: server2Url+"adherents/" + item.id,
  data: JSON.stringify(item),
  contentType: "application/json"
});
},
  deleteItem: function(item) {
  return $.ajax({
  type: "DELETE",
  url: server2Url+"adherents/" + item.id
});
}
},

  fields: [
{ name: "id", type: "number", width: 30, editing: false },
{ name: "reference", type: "text", title: "Référence" },
{ name: "nom", type: "text", title: "Nom" },
{ name: "prenom", type: "text", title: "Prénom" },
{ name: "nss", type: "text", title: "NSS" },
{ name: "email", type: "text", title: "Email" },
{ name: "mobileNo", type: "text", title: "Téléphone" },
{ name: "gender", type: "text", title: "Genre" },
{ name: "situationFamiliale", type: "text", title: "Situation Familiale" },
{ type: "control" }
  ]
});

}
//initjsGridAdherents();



/**
 * Open Universal Relationship Selector popup
 * @param code : API code (socite, offres, etc.)
 * @param multi : true = multi-select
 */

let currentCode = null;
let isMultiSelect = false;
let popupData = [];
let selectedItems = [];

function openRelationPopupPopup(code, multi) {
  currentCode = code;
  isMultiSelect = multi;
  selectedItems = [];

  document.getElementById("relationPopupTitle").innerText =
    "Sélection de " + code;

  // Change header checkbox visibility
  document.getElementById("selectHeader").innerHTML =
    multi ? "Sélection" : "Choisir";

  // Load data from API
  fetch("api/v3/common?code=" + code)
    .then(res => res.json())
    .then(data => {
      popupData = data;
      console.table(popupData)
      renderPopupTable();
      $("#relationPopup").modal("show");
    });
}


function renderPopupTable() {
  let tbody = document.getElementById("popupTableBody");
  tbody.innerHTML = "";

  try {
    popupData.forEach(item => {
      let tr = document.createElement("tr");

      let tdSelect = document.createElement("td");
      if (isMultiSelect) {
        tdSelect.innerHTML = `<input type="checkbox" value="${item.id}" onchange="toggleSelect(${item.id}, this)">`;
      } else {
        tdSelect.innerHTML = `<button class="btn btn-sm btn-outline-primary" onclick="chooseSingle(${item.id})">Choisir</button>`;
      }

      tr.appendChild(tdSelect);
      tr.innerHTML += `
      <td>${item.code || ''}</td>
      <td>${item.reference || ''}</td>
      <td>${item.description || ''}</td>
    `;

      tbody.appendChild(tr);
    });
  }catch (e){
    console.error(e)
  }
}

function toggleSelect(id, checkbox) {
  if (checkbox.checked) {
    selectedItems.push(id);
  } else {
    selectedItems = selectedItems.filter(x => x !== id);
  }
}

function chooseSingle(id) {
  selectedItems = [id];
  applyRelationSelection();
}

function filterPopupList() {
  const search = document.getElementById("popupSearch").value.toLowerCase();
  const filtered = popupData.filter(item =>
    (item.code || "").toLowerCase().includes(search) ||
    (item.label1 || "").toLowerCase().includes(search) ||
    (item.label2 || "").toLowerCase().includes(search)
  );
  popupData = filtered;
  renderPopupTable();
}


// Apply selection for multi-select
function applyRelationSelection() {
  console.log("Selected for " + currentCode, selectedItems);

  // TODO: inject into your form model
  // Example:
  // adherent[currentCode] = isMultiSelect ? selectedItems : selectedItems[0];

  if (multiSelectMode) {
    let selected = $("#relationTable").jsGrid("option", "data")
      .filter(r => r._selected)
      .map(r => r.label1 || r.code)
      .join(", ");
    $(`#${currentField}`).val(selected);
  }
  $('#relationModal').modal('hide');
}

function loadEntityGrid(entityName) {
  fetch(`/api/generated/meta/${entityName}/fields`)
    .then(res => res.json())
    .then(fields => {
      $("#jsGrid").jsGrid({
        width: "100%",
        height: "400px",
        autoload: true,
        inserting: true,
        editing: true,
        sorting: true,
        paging: true,
        controller: {
          loadData: function(filter) {
            return $.getJSON(`/api/${entityName}`);
          },
          insertItem: function(item) {
            return $.ajax({
              type: "POST",
              url: `/api/${entityName}`,
              data: JSON.stringify(item),
              contentType: "application/json"
            });
          },
          updateItem: function(item) {
            return $.ajax({
              type: "PUT",
              url: `/api/${entityName}/${item.id}`,
              data: JSON.stringify(item),
              contentType: "application/json"
            });
          },
          deleteItem: function(item) {
            return $.ajax({
              type: "DELETE",
              url: `/api/${entityName}/${item.id}`
            });
          }
        },
        fields: fields
      });
    });
}

// Usage
// loadEntityGrid("assurance");
