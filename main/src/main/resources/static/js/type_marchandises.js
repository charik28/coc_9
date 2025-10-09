  // --- Fake data example, replace with AJAX fetch from backend ---
  const nodes = [
  { id: '1', article_name_ar: 'مواد غذائية', groupe_level: 0, groupe_parent: null },
  { id: '2', article_name_ar: 'مشروبات', groupe_level: 0, groupe_parent: null },
  { id: '3', article_name_ar: 'مياه معدنية', groupe_level: 1, groupe_parent: '2' },
  { id: '4', article_name_ar: 'عصائر', groupe_level: 1, groupe_parent: '2' },
  ];

  // Build tree
  function buildTree() {
  const topLevel = nodes.filter(n => !n.groupe_parent);
  $('#tree').empty();
  topLevel.forEach(node => {
  const li = $('<li>').append(
  $('<div>')
  .addClass('node-item')
  .text(node.article_name_ar)
  .click(() => selectNode(node.id))
  );
  $('#tree').append(li);
});
}

  // Show children on right side
  function selectNode(id) {
  $('.node-item').removeClass('selected');
  event.target.classList.add('selected');
  const childs = nodes.filter(n => n.groupe_parent === id);
  const tbody = $('#childTable').empty();
  childs.forEach(ch => {
  const tr = $('<tr>')
  .append($('<td>').text(ch.reference_number || ''))
  .append($('<td>').text(ch.article_name_ar))
  .append($('<td>').text(ch.unit || ''))
  .append($('<td>').text(ch.article_number || ''))
  .append(
  $('<td>').html(`<button class="btn btn-sm btn-info" onclick="editNode('${ch.id}')"><i class="fas fa-edit"></i></button>`)
  );
  tbody.append(tr);
});
}

  function editNode(id) {
  const n = nodes.find(n => n.id === id);
  $('#id').val(n.id);
  $('#article_name_ar').val(n.article_name_ar);
  $('#article_name').val(n.article_name);
  $('#unit').val(n.unit);
  $('#reference_number').val(n.reference_number);
  $('#article_number').val(n.article_number);
}

  function saveNode() {
  alert('Saving node (you will replace this with AJAX call)');
}

  function resetForm() {
  $('#nodeForm')[0].reset();
  $('#id').val('');
}

  $(document).ready(buildTree);
