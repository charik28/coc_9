

var currentPage = 0;
var pageSize = 10; // Number of items per page
/*
//$(document).ready(function()
// {
    $.ajax({
        type: 'GET',
        url: '/direction_regionale',
        contentType: "application/json",
        success: function(data) {
            data.forEach(function(region) {
                $('#idRegion').append('<option value="' + region.id + '" >' + region.titre + '</option>');
                //console.log('region: ', region);

            });
        }
    });/*
    document.getElementById('idRegion').addEventListener('click', function(event){
        var selectedRegionId=document.getElementById('idRegion').value;
        // console.log("selectedRegionId: ", selectedRegionId)
        $.ajax({
            type: 'GET',
            url: '/inspection-divisionaire/'+ selectedRegionId,
            contentType: "application/json",
            success: function(data) {
                $('#idDivision').empty();
                data.forEach(function(div) {
                    //console.log("Individual div object:", div); // Log each individual div object
                    $('#idDivision').append('<option value="' + div.idDivision + '" >' + div.titre + '</option>');
                    //console.log('div.idDivision: ', div.idDivision);
                    // console.log('div.titre: ', div.titre);
                });
            }
        });
    });
*/
   /* document.getElementById('divisionId').addEventListener('click', function(event){
        var selectedDivisionId=document.getElementById('divisionId').value;
        // console.log("selectedDivisionId: ", selectedDivisionId)
        $.ajax({
            type: 'GET',
            url: '/brigade/'+ selectedDivisionId,
            contentType: "application/json",
            success: function(data) {

                console.log(selectedDivisionId , "   " , data)
                $('#brigadeId').empty();
               if(!Array.isArray(data))
                {
                    alert('data is not an array')
                    throw ("brigade data is not an array ")
                    return
                }

                data.forEach(function(brigade) {
                    // console.log("Individual div object:", brigade); // Log each individual div object
                    $('#brigadeId').append('<option value="' + brigade.idBrigade + '"  >' + brigade.titre + '</option>');
                    //console.log('div.idDivision: ', div.idDivision);
                    // console.log('div.titre: ', div.titre);
                });
            }
        });
    });*/

    $('#validBtn').click(function() {
        var typeSortie = [];
        $('#typeSortie > div input:checked').each(function() {
            typeSortie.push(this.value);
        });

        var collaboration=[];
        $('#collaboration > div input:checked').each(function() {
            collaboration.push(this.value);
        });

        var formDataObject = new FormData();
        formDataObject.append('typeSortieTable', JSON.stringify(typeSortie)); // Convert array to JSON string
        formDataObject.append('collaborationTable', JSON.stringify(collaboration));

        var formData = $('#operationForm').serializeArray();
        $.each(formData, function(index, field) {
            formDataObject.append(field.name, field.value);
        });

        $.ajax({
            url: baseUrl + '/api/v1/operation',
            type: 'POST',
            data: formDataObject, // Send FormData object directly
            processData: false, // Prevent jQuery from processing the data
            contentType: false, // Let FormData set the content type
            success: function(response) {
                var idBrigade= formDataObject.get('idBrigade');
                console.log('idBrigade= ', idBrigade)
                loadAgents(0,idBrigade);
                loadVehicule(idBrigade);
                loadArm(idBrigade);
                loadCanine();
                console.log('Operation inserted:', formDataObject);
                showpopup(response);

            },
            error: function(error) {
                console.error('Error inserting operation:', formDataObject);
                if (error.responseJSON && error.responseJSON.message)
                    showpopup(error.responseJSON.message);
                else
                    showpopup(error);
            }
        });
    });
    // Array to store selected agents
    var selectedAgents = new Set();
// Function to load agents with pagination
    function loadAgents(page, idBrigade) {
        console.log("idBrigade : ", idBrigade);
        $.get("/api/v1/operation/personnel?page=" + page + "&size=" + pageSize + "&idBrigade=" + idBrigade, function (data) {
            var agents = data;
            console.log("agents : ", agents);
            var totalPages = agents.totalPages;
            console.log("totalPages : ", totalPages);

            // Store selected agents' checkboxes' state
            var checkboxes = $('input[name="agent[]"]');
            checkboxes.each(function () {
                selectedAgents.push({
                    value: $(this).val(),
                    checked: $(this).prop('checked')
                });
            });

            var tableBody = $("#agentTable tbody");
            tableBody.empty();
            $.each(agents.content, function (index, agent) {
                var row = $("<tr>");
                row.append($("<td>").text(index+1));
                row.append($("<td>").text(agent.nom));
                row.append($("<td>").text(agent.prenom));
                row.append($("<td>").text(agent.matricule));
                row.append($("<td>").text(agent.grade));

                // Create checkbox and set its state based on selectedAgents array
                var checkbox = $("<input>").attr({
                    type: "checkbox",
                    name: "agent[]",
                    value: agent.matricule,
                    checked: false  //isSelected(agent.matricule)
                });
                var selectCell = $("<td>").append(checkbox);
                row.append(selectCell);
                tableBody.append(row);
            });

            // Restore selected agents' checkboxes'' state
            checkboxes = $('input[name="agent[]"]');
            checkboxes.each(function () {
                var value = $(this).val();
                var checked = false //isSelected(value);
                $(this).prop('checked', checked);
            });

            var paginationHtml = "<button id='prevPage'> << </button>";
            for (var i = 0; i < 0; i++) {
                paginationHtml += "<button class='pageLink' data-page='" + i + "'>" + (i + 1) + "</button>";
            }
            paginationHtml += "<button id='nextPage'> >> </button>";
           // $("#paginationControls").html(paginationHtml);

// Pagination controls
            $("#prevPage").click(function () {
                if (currentPage > 0) {
                    currentPage--;
                    loadAgents(currentPage, idBrigade);
                }
            });

            $("#nextPage").click(function () {
                if (currentPage < totalPages - 1) {
                    currentPage++;
                    loadAgents(currentPage, idBrigade);
                }
            });

            $(".pageLink").click(function () {
                currentPage = parseInt($(this).data("page"));
                loadAgents(currentPage, idBrigade);
            });
        });
    }


// Function to check if an agent is selected
    function isSelected(value) {


        for (var i = 0; i < selectedAgents.length; i++) {
            if (selectedAgents[i].value === value && selectedAgents[i].checked) {
                return true;
            }
        }
        return false;
    }


    function loadVehicule(idBrigade) {
        console.log("idBrigade : ", idBrigade);
        $.get("/api/v1/operation/vehicule?id="+ idBrigade, function (data) {
            var vehicules = data;
            console.log("vehicules : ", vehicules);

            var tableBody = $("#vehiculeTable tbody");

            $.each(vehicules, function (index, vehicule) {
                var row = $("<tr>");
                row.append($("<td>").text(index+1));
                row.append($("<td>").text(vehicule.matricule));
                row.append($("<td>").text(vehicule.marque));
                row.append($("<td>").text(vehicule.modele));
                row.append($("<td>").text(vehicule.numeroChassis));

                //  var agentId = agents.matricule;
                var checkbox = $("<input>").attr({
                    type: "checkbox",
                    name: "user[]",
                    value: vehicule.matricule
                });

                var selectCell = $("<td>").append(checkbox);

                row.append(selectCell);
                tableBody.append(row);
            });

        });
    }

    function loadArm(idBrigade) {
        console.log("idBrigade arm: ", idBrigade);
        $.get("/api/v1/operation/arm?id=" + idBrigade, function (data) {
            var arm = data;
            console.log("arm : ", arm);
            var tableBody = $("#armTable tbody");

            $.each(arm, function (index, armData) {
                var row = $("<tr>");
                row.append($("<td>").text(index + 1));
                row.append($("<td>").text(armData.numSerie));
                row.append($("<td>").text(armData.nom));
                row.append($("<td>").text(armData.typeMinution));

                var inputElement = $('<input>').attr({
                    type: 'number',
                    class: 'form-control form-control-sm',
                    style: 'width: 70px;',
                    id: 'etat', // Append index to create unique IDs
                    name: 'etat'
                });

                var cell = $('<td>').append(inputElement);
                row.append($("<td>").text(armData.etat));

                var checkbox = $("<input>").attr({
                    type: "checkbox",
                    name: "user[]",
                    value: armData.numSerie // Use a unique value, like armData.id, for checkbox value
                });
                var selectCell = $("<td>").append(checkbox);

                row.append(cell);
                row.append(selectCell);

                tableBody.append(row);
            });
        });
    }
    function loadCanine() {
        $.get("/api/v1/operation/canine", function (data) {
            var canine = data;
            console.log("canine : ", canine);
            var tableBody = $("#canineTable tbody");

            $.each(canine, function (index, canineData) {
                var row = $("<tr>");
                row.append($("<td>").text(index + 1));
                row.append($("<td>").text(canineData.matricule));
                row.append($("<td>").text(canineData.nom));
                row.append($("<td>").text(canineData.specialite));
                row.append($("<td>").text(canineData.nomMaitre));
                row.append($("<td>").text(canineData.annee));
                row.append($("<td>").text(canineData.vehic));

                var checkbox = $("<input>").attr({
                    type: "checkbox",
                    name: "user[]",
                    value: canineData.matricule // Use a unique value for the checkbox
                });
                var selectCell = $("<td>").append(checkbox);

                row.append(selectCell);

                tableBody.append(row);
            });
        }).fail(function (jqXHR, textStatus, errorThrown) {
            console.error("Error loading canine data:", errorThrown);
        });
    }
    function showpopup(message) {
        alert(message);
    }

    //$(document).ready(function()
    // {
        var formData = new FormData();

        $("#nextBtnAgnt").click(function() {
            //var selectedAgents = [];
            $('#agentTable > tbody > tr > td input:checked').each(function() {
                selectedAgents.push(this.value);
            });
            if (selectedAgents.length === 0) {
                showpopup("Veuillez choisir des Agents pour l'opération");
            } else {
                $("#vehicules-tab").tab("show"); // Activate the vehicules tab
                console.log(selectedAgents);

                for (let i = 0; i < selectedAgents.length; i++) {
                    if(selectedAgents[i].value!=null)
                    {formData.append('agents', selectedAgents[i].value);}0
                    console.log('agents', selectedAgents[i]);
                }
            }
        });
        $("#prevBtnVehicule").click(function() {
            $("#agents-tab").tab("show"); // Activate the vehicules tab
        });

        $("#nextBtnVehicule").click(function() {
            var selectedVehicule = [];
            $('#vehiculeTable > tbody > tr > td input:checked').each(function() {
                selectedVehicule.push(this.value);
            });

            if (selectedVehicule.length == 0) {
                showpopup("Veuillez choisir des Vehicules pour l'operation");
            } else {
                $("#armes-tab").tab("show"); // Activate the vehicules tab
                console.log(selectedVehicule)
                for (let i = 0; i < selectedVehicule.length; i++) {

                    formData.append('vehicules', selectedVehicule[i]);
                    console.log('vehicules', selectedVehicule[i])
                }
            }
        });
        $("#prevBtnArme").click(function() {
            $("#vehicules-tab").tab("show"); // Activate the vehicules tab
        });
        $("#nextBtnArme").click(function() {
            var selectedArme= [];
            var selectedEtat=[];

            $('#armTable > tbody > tr > td input:checked').each(function() {
                selectedArme.push(this.value);
                selectedEtat.push( document.getElementById('etat').value);
            });
            console.log('selectedEtat', selectedEtat);

            if (selectedArme.length == 0) {
                showpopup("Veuillez choisir des Armes pour l'operation");
            } else {
                $("#canine-tab").tab("show"); // Activate the vehicules tab
                console.log(selectedArme)
                for (let i = 0; i < selectedArme.length; i++) {
                    formData.append('armes', selectedArme[i]);
                    formData.append('etats', selectedEtat[i]);
                    console.log('armes', selectedArme[i])
                    console.log('etats', selectedEtat[i])
                }
            }
        });

        $("#prevBtnCanine").click(function() {
            $("#armes-tab").tab("show"); // Activate the vehicules tab
        });
        $("#nextBtnCanine").click(function() {
            var selectedCanine= [];
            $('#canineTable > tbody > tr > td input:checked').each(function() {
                selectedCanine.push(this.value);
            });

            if (selectedCanine.length == 0) {
                showpopup("Veuillez choisir des Canines pour l'operation");
            } else {
                $("#materiel-tab").tab("show"); // Activate the vehicules tab
                console.log(selectedCanine)
                for (let i = 0; i < selectedCanine.length; i++) {
                    formData.append('canines', selectedCanine[i]);
                    console.log('canines', selectedCanine[i])
                }
            }
        });

        $("#prevBtnMat").click(function() {
            $("#canine-tab").tab("show"); // Activate the vehicules tab
        });
        $("#nextBtnMat").click(function() {
            var selectedMat = []; // Array to store selected materials
            var selectedQts = []; // Array to store corresponding quantities

            $('#matTable tbody tr').each(function () {
                var checkbox = $(this).find('input[type="checkbox"]:checked');
                if (checkbox.length > 0) {
                    var value = checkbox.val(); // Get the value of the checked checkbox
                    var quantityInput = $(this).find('input[name="quantity"]'); // Find the corresponding quantity input
                    var quantity = quantityInput.val(); // Get the quantity value

                    selectedMat.push(value); // Add the selected material to the array
                    selectedQts.push(quantity); // Add the corresponding quantity to the array
                }
            });
            console.log("selectedMat:", selectedMat);
            console.log("selectedQts:", selectedQts);

            if (selectedMat.length == 0) {
                showpopup("Veuillez choisir des Materiels pour l'operation");
            } else {
                for (let i = 0; i < selectedMat.length; i++) {
                    formData.append('materiels', selectedMat[i]);
                    formData.append('quantity', selectedQts[i]);
                }
                var numMission = document.getElementById('numMission').value;
                formData.append('numMission', numMission)
                console.log(formData);
                fetch("/api/v1/operation/agnt-vhcl-arm-cnn", {
                    method: 'POST',
                    body: formData,
                    //processData: false, // Set processData to false to prevent jQuery from automatically processing the data
                    contentType: 'application/json'
                }).then(data => {
                    console.log('Success:', data);
                    showpopup(data);
                }).catch(error => {
                    console.error('Error:', error);
                    // Handle error
                });
            }
        });

    // });
// });