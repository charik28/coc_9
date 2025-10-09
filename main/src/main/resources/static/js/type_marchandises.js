

let nodes = []; // Global array to hold all nodes

async function buildTree() {

  try {
    // Fetch data from API
    const response = await fetch('/api/marchandise/groupes', {method: 'GET'});
    if (!response.ok) throw new Error('Erreur de chargement des marchandises');
    nodes = await response.json();


    const topLevel = nodes.filter(n => n.groupeLevel<3);
    $('#tree').empty();
    topLevel.forEach(node => {
      const li = $('<li>').append(
        $('<div>')
          .addClass('node-item')
          .text(node.nm)
          .click(() => selectNode(node.id))
      );
      $('#tree').append(li);
    });
  } catch (err) {
    console.error('Erreur:', err);
    $('#tree').html('<li>Erreur de chargement des données.</li>');
  }
}

  // Show children on right side
  function selectNode(id) {
  $('.node-item').removeClass('selected');
  event.target.classList.add('selected');
  const childs = nodes.filter(n => n.groupeParentId === id);
  const tbody = $('#childTable').empty();
  childs.forEach(ch => {
  const tr = $('<tr>')
  .append($('<td>').text(ch.id || 'NULL'))
  .append($('<td>').text(ch.nm || 'NULL'))
  .append($('<td>').text(ch.unit || 'NULL'))
  .append($('<td>').text(ch.article_number || 'NULL'))
  .append(
  $('<td>').html(`<button class="btn btn-sm btn-info" onclick="editNode('${ch.id}')"><i class="fas fa-edit"></i></button>`)
  );
  tbody.append(tr);
});
}

  function editNode(id) {
  const n = nodes.find(n => n.id === id);
  $('#id').val(n.id);
  $('#nm').val(n.nm);
  $('#frNm').val(n.nm);
  $('#unit').val(n.unit);
  $('#parent').val(n.id);
  $('#article_number').val(n.nm);
}

  function saveNode() {
  alert('Saving node (you will replace this with AJAX call)');
}

  function resetForm() {
  $('#nodeForm')[0].reset();
  $('#id').val('');
}

  // $(document).ready(buildTree);
