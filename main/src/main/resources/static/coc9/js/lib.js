 /**
 *
 *@project DGD_GEO
 *@Author Abdessamie Charik
 */
/*    function loadContent(page) {

        if(page == '#')
        {
         console.log('#')
            return;
        }

        //const URL='./dashboards/admin' + '/' + page+'.html'
        const URL=baseUrl+'?path=' + page+'.html'
        console.log("loadContent " +URL)
        $.ajax({
            url: URL, // Adjust the URL to match your server endpoint
            type: 'GET',
            success: function (data) {
               /!* if(data.redirect)
                    location.reload();
                else*!/
                $('#contentPlaceholder').html(data);


            },
            error: function (error) {
                location.reload();
                //console.error('Error loading content:', error);
            }
        });
    }*/



var loadedFraments = [];

var lastPage;
async function loadContent0(page , placeHolder='#indexContentPlaceholder') {
    if (page === '#') {
        console.log('#');
        return;
    }
    if(page == lastPage )
        return;

    if(!page.includes(config.prefix))
        page = config.prefix + page + config.sufix;

    //console.log(page)
    try {
        const response = await fetch(page);
        if (response.ok) {
            const data = await response.text();
            $(placeHolder).html(data);
               //todo
            // saveCrntLocation(URL)
        } else {
            console.error('Error loading content:', response.status , page);
        }
    } catch (error) {
        console.error('Error loading content:', error);
    }
}

 function loadContent2(page , divId) {
     $.ajax({
         url: config.prefix + page +config.sufix, // Adjust the URL to match your server endpoint
         type: 'GET',
         success: function (data) {

                 $('#'+divId).html(data);

             },
         error: function (error) {
             console.error('Error loading content:', error);

           //  location.reload();
         }
     })}



function saveCrntLocation(URL) {
    // Check if the page URL is absolute or relative
/*
    const isAbsoluteUrl = URL.startsWith('http://') || URL.startsWith('https://');
    // Construct the full URL based on whether it's an absolute or relative URL

     URL = isAbsoluteUrl ? URL : './?path=' + URL;

    // Check if the page URL contains './?path='
    if (!URL.includes('./?path=')) {
        URL = './?path=' + page.replace(baseUrl, '');
    }
    if (!isAbsoluteUrl) {
        var basePath = window.location.href.split('?')[0];
        const newUrl = basePath + '?path=' + page;

        if (loadedFraments.some(item => item.divId === divId)) {
            console.log(divId + " Fragment already loaded");
            $('#' + divId).html(loadedFraments.find(item => item.divId === divId).data);
            return Promise.resolve();
        }
        loadedFraments.push({divId: page, data: data});
            // window.history.pushState({page: newUrl}, '', newUrl);
      //  console.log("Saving the " + newUrl + " to the localStorage");
      }
*/



        localStorage.setItem('currentPage', URL);

}

 function populateDivisions() {
     let  divisionSelect=  document.getElementById('divisionId')
     let brigadeSelect = document.getElementById('brigadeId')

     if(division)
     {
          var option = document.createElement('option');
         option.value = division.id;
         option.text = division.titre;
         divisionSelect.appendChild(option);
         divisionSelect.selectedIndex=0;
          divisionSelect.disabled  = true
          populateBrigades()
         return;
if(!brigade) {//todo

    var idBrigade = document.getElementById('brigadeId').value
    console.log('idBrigade= ', idBrigade)
    // loadAgents(0, idBrigade);
    loadVehicule(idBrigade);
    loadArm(idBrigade);
}

     if(mapInstance){

         selectedLayerId = parseInt(selectedRegionId)
         mapInstance.fitBounds(_layers[selectedLayerId].getBounds());
         //map.enableOnly _layers[polygonId]

     }
     return;
     }

     var selectedRegionId = document.getElementById('regionId').value;

     if(divisionSelect==null)
     {
         divisionSelect = document.getElementById('divisionId');
         brigadeSelect = document.getElementById('brigadeId')
     }
     // Reset divisions and brigades dropdowns
     divisionSelect .innerHTML = '<option value="">Choisissez une Division </option>';
     // Fetch divisions for the selected region


     if (selectedRegionId) {
         fetch('/api/division/' + selectedRegionId,{
             method: 'GET',
             headers: new Headers({
                 'Content-Type': 'application/json',
                 // Add any other headers or session-related information here
             }),
             credentials: 'include',
         })
             .then(response => {

                 if (!response.ok) {

                      makeToastInfo(`Erreur lors de la récupération des données` , response)
                 }
                 return response.json();
             })
             .then(data => {
                 divisionSelect .innerHTML = '<option value="">Choisissez une Division </option>';

                 // Update divisions dropdown
                 data.forEach(division => {
                     var option = document.createElement('option');
                     option.value = division.id;
                     option.text = division.titre;
                     document.getElementById('divisionId').appendChild(option);
                 });

             }).catch(error => console.error('Error fetching divisions:', error));
     }




 }
 function populateBrigades(operationnel  = '') {
     var selectedDivisionId = parseInt(document.getElementById('divisionId').value, 10);



     if(brigade) {

         var option = document.createElement('option');
         option.value = brigade.id;
         option.text = brigade.titre;
        brigadeSelect= document.getElementById('brigadeId')
         brigadeSelect.appendChild(option);
         brigadeSelect.selectedIndex=0;
         brigadeSelect.disabled = true

         return;
     }
     // Reset brigades dropdown
     document.getElementById('brigadeId').innerHTML = '<option value="">Choisissez une Brigade</option>';
     if(selectedDivisionId == ''){
         return;
     }
    //todo '/operationnel='+operationnel
     // Fetch brigades for the selected division

         fetch('/api/brigade/' + selectedDivisionId , {
             method: 'GET',
             headers: new Headers({
                 'Content-Type': 'application/json',
                 // Add any other headers or session-related information here
             }),
             credentials: 'include',
         })
             .then(response => {
                 if (!response.ok) {
                      makeToastInfo("err" , response)
                 }
                 return response.json();
             })
             .then(data => {
                 // Update brigades dropdown

                 brigadeSelect = document.getElementById('brigadeId');
                 brigadeSelect.innerHTML = '<option value="">Choisissez une Brigade </option>';


                 data.forEach(brigade => {
                     var option = document.createElement('option');
                     option.value = brigade.id;
                     option.text = brigade.titre;
                     brigadeSelect.appendChild(option);
                 });

                 if(_user?.brigade?.id)
                 {
                     console.log(_user?.division?.id);
                    brigadeSelect.selectedIndex = _user.brigade.id;

                 }

             })
             // .catch(error => console.error('Error fetching brigades:', error));

 }



    function  register() {

            // Collect form data
            var formData = $('#registrationForm').serialize();

            if(handleRoleSelection() === "false")
            {
                alert("you must corect input")
                return "err";
            }
            // Perform AJAX POST request
            $.ajax({
                type: 'POST',
                url: '/register',
                data: formData,
                success: function (response) {
                    // Handle success response
                    if (response.error) {
                        // Display error message

                        $('#errorAlert').html('<p>' + response.error + '</p>').show();
                        $('#successAlert').hide();
                    } else {
                        // Display success message

                        $('#successAlert').html('<p>' + response.message + '</p>').show();
                        $('#errorAlert').hide();
                    }
                },
                error: function (error) {
                    // Handle error response

                    $('#errorAlert').html('<p>' + error.responseText + '</p>').show();
                    $('#successAlert').hide();
                }
            });

    }


/*

    document.addEventListener('DOMContentLoaded', function() {
        // Directly use the regions passed to the Thymeleaf model
        console.log(" loading regions")
        var regions =  []; //[[${regions}]]

        // Update region dropdown
        var regionDropdown = document.getElementById('regionDropdown');
        regions.forEach(region => {
            var option = document.createElement('li');
            option.classList.add('dropdown-item');
            option.innerHTML = '<a href="#" onclick="selectRegion(' + region.id + ')">' + region.name + '</a>';
            regionDropdown.appendChild(option);
        });
    });
*/
 function fetchAllRegions() {
     // Reset divisions and brigades dropdowns


     // document.getElementById('regionDropdown').innerHTML = '<li class="dropdown-item">Choisissez une Brigade</li>';
     regionDropdown = document.getElementById('regionDropdown');
     regionDropdown.innerHTML=
     '<select id="regionDropdown" name="regionId" className="form-control" onChange="populateDivisions()">'
     // Fetch divisions for the selected region
     fetch('/api/region/getAllRegions' , {
         method: 'GET',
         headers: new Headers({
             'Content-Type': 'application/json',
         }),
         credentials: 'include',
     })

         .then(response => {
             if (!response.ok) {
                 console.error(response)

                 makeToastInfo("err" , response)
                  makeToastInfo("err" , response)
             }
             return response.json();
         })
         .then(data => {
             console.log(data)

             // Update regions dropdown
             var regionDropdown = document.getElementById('regionDropdown');
             data.forEach(region => {
                 var option = document.createElement('option');
                 option.classList.add('dropdown-item');

                 option.value = region.id ;
                 option.text = region.titre;
                 // '<a href="#" value='+region.id +'>'+ region.name + '</a>';
                 regionDropdown.appendChild(option);
             });

             regionDropdown.innerHTML += '</select>'
         })
         //.catch(error => console.error('Error fetching regionDropdown:', error));
 }
    function selectRegion(regionId) {
        // Reset divisions and brigades dropdowns

        document.getElementById('divisionDropdown').innerHTML = '<li class="dropdown-item">Choisissez une Brigade</li>';
        document.getElementById('brigadeDropdown').innerHTML = '<li class="dropdown-item">Choisissez une Brigade</li>';

        // Fetch divisions for the selected region
        fetch('/api/getDivisions?regionId=' + regionId, {
            method: 'GET',
            headers: new Headers({
                'Content-Type': 'application/json',
                // Add any other headers or session-related information here
            }),
            credentials: 'include',
        })
            .then(response => {
                if (!response.ok) {
                     makeToastInfo("err" , response)
                }

                return response.json();
            })
            .then(data => {
                // Update divisions dropdown
                var divisionDropdown = document.getElementById('divisionDropdown');
                data.forEach(division => {
                    var option = document.createElement('li');
                    option.classList.add('dropdown-item');
                    option.innerHTML = '<a href="#" onclick="selectDivision(' + division.id + ')">' + division.titre + '</a>';
                    divisionDropdown.appendChild(option);
                });
            })
            .catch(error => console.error('Error fetching divisions:', error));
    }

    function selectDivision(divisionId) {
        // Reset brigades dropdown
        document.getElementById('brigadeDropdown').innerHTML = '<li class="dropdown-item">Choisissez une Brigade</li>';

        // Fetch brigades for the selected division
        fetch('/api/brigade/getBrigades/' + divisionId, {
            method: 'GET',
            headers: new Headers({
                'Content-Type': 'application/json',
                // Add any other headers or session-related information here
            }),
            credentials: 'include',
        })
            .then(response => {
                if (!response.ok) {
                     makeToastInfo("err" , response)
                }
                return response.json();
            })
            .then(data => {
                // Update brigades dropdown
                var brigadeDropdown = document.getElementById('brigadeDropdown');
                data.forEach(brigade => {
                    var option = document.createElement('li');
                    option.classList.add('dropdown-item');
                    option.innerHTML = '<a href="#">' + brigade.name + '</a>';
                    brigadeDropdown.appendChild(option);
                });
            })
            .catch(error => console.error('Error fetching brigades:', error));
    }


    var regionDropdown,divisionDropdown,brigadeDropdown,selectedRole;

    function handleRoleSelection() {
            selectedRole = $("#role").val();

            // Check if a role is selected
            if (!selectedRole || selectedRole === "Select Role") {
                // Display an error message or take appropriate action
                alert("Please select a valid role before proceeding.");
                return "Please select a valid role before proceeding";
            }

             regionDropdown = $("#regionDropdownDiv");
             divisionDropdown = $("#divisionDropdown");
            brigadeDropdown = $("#brigadeDropdown");

            // Show the relevant dropdowns based on the selected role
            switch (selectedRole) {
                case "REGION_USER":
                    regionDropdown.show();
                    divisionDropdown.hide();
                    brigadeDropdown.hide();
                    if($("#regionId").val() === '')
                    {
                        return "false";
                    }
                    return "REGION_USER";
                case "DIVISION_USER":
                    regionDropdown.show();
                    divisionDropdown.show();
                    brigadeDropdown.hide();
                    if($("#divisionId").val() === '')
                    {
                        return "false";
                    }
                    return  "DIVISION_USER";
                case "BRIGADE_USER":
                    regionDropdown.show();
                    divisionDropdown.show();
                    brigadeDropdown.show();
                    if($("#brigadeId").val() === '')
                    {
                        return "false";
                    }
                   return  "BRIGADE_USER";
                default:
                    console.error("Unexpected role: " + selectedRole);
                    // Handle other cases if needed
                    return "err";
            }
        }



    function searchUser(){
        var regionId = $("#regionId").val();
        var divisionId = $("#divisionId").val();
        var brigadeId = $("#brigadeId").val();
        var username = $("input[type=search]").val();

        var form=document.getElementById("search-user");

        var formData = new FormData(form);
        var params = new URLSearchParams(formData);

        fetch("/api/getUsersByDepartment?" + params.toString(), {
            method: 'GET',
        }).then(res => res.json())
            .then(data => {

                updateTable(data)
            });
    }

    // Function to update the table with the retrieved users
    function updateTable(users) {
        // Clear existing table rows
        $("tbody").empty();

        // Populate table with new user data
        $.each(users, function (index, user) {
            console.log(user)

            var row = '<tr>';
            row += '<td>' + user.matricule + '</td>';
            row += '<td>' + user.userName + '</td>';
            row += '<td>' + user.role + '</td>';
            row += '<td>' + (user.region ? user.region.name : '') + '</td>';
            row += '<td>' + (user.division ? user.division.name : '') + '</td>';
            row += '<td>' + (user.brigade ? user.brigade.name : '') + '</td>';
            row += '<td class="justify-content-start mr-2">';
            row += '<a><i class="fas fa-trash text-danger mr-4" role="button" ></i></a>';
            row += '<a><i class="fas fa-pen text-primary mr-8" role="button"></i></a>';
            row += '</td>';
            row += '</tr>';
            $("tbody").append(row);
        });
    }
    var loadSearch ,loadOperation ,loadInsertBrigade;

var loadedScripts = [];
function importScript(src, async = false, resolve=true) {
    console.log(src)
    if (loadedScripts.includes(src)) {
        console.error(src + " already loaded");
        return;
    }

    loadedScripts.push(src);
        return new Promise((resolve, reject) => {
            const script = document.createElement('script');
            script.src = src;
            script.async = async;

            script.onload = () => {
              //  console.log(`Script loaded: ${src}`);
                if(resolve)
                    resolve();
            };

            script.onerror = () => {
                logg(`Error loading script: ${src}`);
               // reject();
            };

            document.head.appendChild(script);
        });
    }
 // Function to fetch regions from the API and populate the select element

var region , division , brigade
 function populateRegions( regionSelect ='regionId' ) {

     var regionSelect = document.getElementById('regionId');

     if(_user?.departmentVo.level===0) {
         fetch('api/region/getAllRegions')
             .then(response => {
                 if (!response.ok) {
                     makeToastInfo("err", response)
                 }
                 return response.json();
             })
             .then(data => {
                 regionSelect .innerHTML = '<option value="">Choisissez une Region </option>';

                 data.forEach(region => {
                     const option = document.createElement('option');
                     option.value = region.id;
                     option.text = region.titre;
                     regionSelect.appendChild(option);
                 });


             })
             .catch(error => {
                 console.error('Error fetching regions:', error);
             });

         // populateDivisions()
         //  populateBrigades()
         return;
     }     if(_user?.departmentVo.level===1) {

         region  = _user?.departmentVo

         const option = document.createElement('option');
         option.value = region.id;
         option.text = region.titre;
         regionSelect.appendChild(option);
         regionSelect.selectedIndex=0
         regionSelect.disabled  = true
         populateDivisions();

         return;
     }
     if(_user?.departmentVo.level===2) {

         region  = _user?.departmentVo.parent
         division =_user?.departmentVo

         const option = document.createElement('option');
         option.value = region.id;
         option.text = region.titre;
         regionSelect.appendChild(option);
         regionSelect.selectedIndex=0
         regionSelect.disabled  = true
         populateDivisions();

         return;
     }

     if(_user && _user?.departmentVo){

          region   = _user?.departmentVo?.parent?.parent
          division = _user?.departmentVo?.parent
          brigade  = _user?.departmentVo

         const option = document.createElement('option');
         option.value = region.id;
         option.text = region.titre;
         regionSelect.appendChild(option);
        regionSelect.selectedIndex=0
         regionSelect.disabled  = true
         populateDivisions();




       //  return;
     }
     if (mapInstance) {
         // Show only layer2
         /*         map.eachLayer(function(layer) {
                      for (let i = 0; i < _layers.length; i++) {
                          if (i+1 === _user.region.id) {
                              continue;
                          }

                          if (layer === _layers[i]) {
                              layer.removeFrom(map);
                          }
                      }
                  });*/
     }

 }
 function populateFonctions() {
     fetch('personnel/getFonctions')
         .then(response => {
             if (!response.ok) {
                  makeToastInfo("err" , response)
             }
             return response.json();
         })
         .then(data => {

             const FonctionSelect = document.getElementById('searchFonction');
             data.forEach(Fonction => {
                 const option = document.createElement('option');
                 option.value = Fonction;
                 option.text = Fonction;
                 FonctionSelect.appendChild(option);
             });
         })
         .catch(error => {
             console.error('Error fetching Fonctions:', error);
         });
 }

 function populateGrades() {
     fetch('personnel/getGrades')
         .then(response => {
             if (!response.ok) {
                  makeToastInfo("err" , response)
             }
             return response.json();
         })
         .then(data => {

             const GradeSelect = document.getElementById('searchgrade');
             data.forEach(Grade => {
                 const option = document.createElement('option');
                 option.value = Grade;
                 option.text = Grade;
                 GradeSelect.appendChild(option);
             });
         })
         .catch(error => {
             console.error('Error fetching Fonctions:', error);
         });
 }


/*
async function loadAdminFragments(){

    await loadComponent('admindashboard' , 'dashboards/admin/admindashboard')
    await loadComponent('navbar' , 'navbar/navbar')
    await loadComponent('sidebar' , 'sidebar/sidebar')
    await loadComponent('footer' , 'sidebar/footer')

}*/


