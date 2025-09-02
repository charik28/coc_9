/**
 *
 *@project DGD_GEO
 *@Author Abdessamie Charik
 */

function showpopup(msg) {
    // Create a Bootstrap modal element
    var modalHtml = '<div class="modal fade" id="errorModal" tabindex="-1" role="dialog" aria-labelledby="errorModalLabel" aria-hidden="true">';
    modalHtml += '<div class="modal-dialog" role="document">';
    modalHtml += '<div class="modal-content">';
    modalHtml += '<div class="modal-header">';
    modalHtml += '<h5 class="modal-title" id="errorModalLabel">Responce:</h5>';
    modalHtml += '<button type="button" class="close" data-dismiss="modal" aria-label="Close">';
    modalHtml += '<span aria-hidden="true">&times;</span>';
    modalHtml += '</button>';
    modalHtml += '</div>';
    modalHtml += '<div class="modal-body">';
    modalHtml += '<p>' + msg + '</p>';
    modalHtml += '</div>';
    modalHtml += '<div class="modal-footer">';
    modalHtml += '<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>';
    modalHtml += '</div>';
    modalHtml += '</div>';
    modalHtml += '</div>';
    modalHtml += '</div>';

    // Append the modal to the body
    $('body').append(modalHtml);

    // Show the modal
    $('#errorModal').modal('show');

    // Remove the modal from the DOM after it's hidden
    $('#errorModal').on('hidden.bs.modal', function() {
        $(this).remove();
    });
}