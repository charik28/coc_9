/**
 *
 *@project DGD_GEO
 *@Author Abdessamie Charik
 */
function uploadExcelFile(file) {
    const formData = new FormData();
    formData.append('file', file);

    fetch('/parse-excel', {
        method: 'POST',
        body: formData,
    })
        .then(response => response.json())
        .then(data => {
            const table = generateHtmlTable(data);
            document.getElementById('table-container').innerHTML = table;
        })
        .catch(error => {
            console.error('Error:', error);
        });
}

function generateHtmlTable(data) {
    let html = '<table class="table table-bordered table-hover">';
    html += '<thead><tr>';

    for (const header of data[0]) {
        html += `<th>${header}</th>`;
    }

    html += '</tr></thead><tbody>';

    for (let i = 1; i < data.length; i++) {
        html += '<tr>';

        for (const cell of data[i]) {
            html += `<td>${cell}</td>`;
        }

        html += '</tr>';
    }

    html += '</tbody></table>';

    return html;
}

// Example usage: input element with id "excel-file-input"
const fileInput = document.getElementById('excel-file-input');
fileInput.addEventListener('change', () => {
    const file = fileInput.files[0];
    uploadExcelFile(file);
});