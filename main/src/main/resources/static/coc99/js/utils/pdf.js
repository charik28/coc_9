/**
 *
 *@project DGD_GEO
 *@Author Abdessamie Charik
 */


/*
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.68/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.68/vfs_fonts.js"></script>
 */
function exportTableToPDF(tbId) {
    // Get the table element
    var table = document.getElementById(tbId);

    // Create the PDF document definition
    var docDefinition = {
        content: [
            { text: "Table to PDF Export", style: "header" },
            { table: { body: getTableData(table) } }
        ],
        styles: {
            header: { fontSize: 16, bold: true, margin: [0, 0, 0, 10] }
        }
    };

    // Generate the PDF
    pdfMake.createPdf(docDefinition).download("table-export.pdf");
}

function getTableData(table) {
    var data = [];
    var rows = table.getElementsByTagName("tr");

    for (var i = 0; i < rows.length; i++) {
        var tableRow = [];
        var cells = rows[i].getElementsByTagName("td");

        for (var j = 0; j < cells.length; j++) {
            tableRow.push(cells[j].innerText);
        }

        data.push(tableRow);
    }

    return data;
}