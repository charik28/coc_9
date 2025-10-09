let nodes = []; // Global array to hold all nodes

async function buildTree() {
  try {
    const response = await fetch('/api/marchandise/groupes', { method: 'GET' });
    if (!response.ok) throw new Error('Erreur de chargement des marchandises');
    nodes = await response.json();

    $('#tree').empty();

    // Find all top-level nodes (those that have at least one child)
    const topLevel = nodes.filter(n => hasChildren(n.id));

    if (topLevel.length === 0) {
      $('#tree').html('<li>لا توجد مجموعات تحتوي على عناصر فرعية.</li>');
      return;
    }

    // Build tree from top-level parents only
    const ul = $('<ul>').addClass('tree-level');
    topLevel.forEach(node => {
      ul.append(createTreeNode(node));
    });

    $('#tree').append(ul);
  } catch (err) {
    console.error('Erreur:', err);
    $('#tree').html('<li>Erreur de chargement des données.</li>');
  }
}

/**
 * Recursively create a tree node only if it has children.
 */
function createTreeNode(node) {
  // Skip nodes that are not parents
  const children = nodes.filter(n => n.groupeParentId === node.id);
  if (children.length === 0) return null;

  const li = $('<li>').addClass('tree-node');

  const div = $('<div>')
    .addClass('node-item')
    .text(node.nm)
    .click(event => selectNode(event, node.id));

  li.append(div);

  const ul = $('<ul>').addClass('tree-sub');
  children.forEach(child => {
    const childLi = createTreeNode(child);
    if (childLi) {
      // Only append real groups (those with sub-children)
      ul.append(childLi);
    } else {
      // If it’s a leaf (no children), show as plain item
      const leaf = $('<li>')
        .addClass('leaf-item')
        .append(
          $('<div>')
            .addClass('node-leaf')
            .text(child.nm)
            .click(event => selectNode(event, child.id))
        );
      ul.append(leaf);
    }
  });

  li.append(ul);
  return li;
}

/**
 * Check if node has children
 */
function hasChildren(id) {
  return nodes.some(n => (n.groupeParentId!=='' &&n.groupeParentId === id));
}

/**
 * Show direct children in the right table
 */
function selectNode(event, id) {
  $('.node-item, .node-leaf').removeClass('selected');
  $(event.target).addClass('selected');

  const childs = nodes.filter(n => n.groupeParentId === id);
  const tbody = $('#childTable').empty();

  if (childs.length === 0) {
    tbody.append('<tr><td colspan="5" class="text-muted">لا توجد عناصر فرعية</td></tr>');
    return;
  }

  childs.forEach(ch => {
    const tr = $('<tr>')
      .append($('<td>').text(ch.id || 'NULL'))
      .append($('<td>').text(ch.nm || 'NULL'))
      .append($('<td>').text(ch.unit || 'NULL'))
      .append($('<td>').text(ch.article_number || 'NULL'))
      .append(
        $('<td>').html(
          `<button class="btn btn-sm btn-info" onclick="editNode('${ch.id}')">
             <i class="fas fa-edit"></i>
           </button>`
        )
      );
    tbody.append(tr);
  });
}

function editNode(id) {
  const n = nodes.find(n => n.id === id);
  if (!n) return;
  $('#id').val(n.id);
  $('#nm').val(n.nm);
  $('#frNm').val(n.frNm);
  $('#unit').val(n.unit);
  $('#parent').val(n.groupeParentId);
  $('#article_number').val(n.article_number || '');
}

function saveNode() {
  alert('Saving node (replace with AJAX call)');
}

function resetForm() {
  $('#nodeForm')[0].reset();
  $('#id').val('');
}

// $(document).ready(buildTree);
