/**
 *
 *@project DGD_GEO
 *@Author Abdessamie Charik
 */

var baseUrl = "http://localhost";
var isCursorOverMap = false;

// Create a set to store the not removable markers
var notRemovableMarkers = new Set();


// const TILE_LAYER = 'http://192.168.1.7/hot/{z}/{x}/{y}.png';

//const TILE_LAYER = 'http://localhost/satmap/{z}/{x}/{y}.jpg'; // Satellite view

var config;
var PROFILE_OFFLINE =false; //todo

if ( typeof config == 'undefined') {
     config = {
          TILE_LAYER : 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
        ATTRIBUTION: 'Map data  CNTSID',
        sufix: "", // ".html";
        prefix: '',
        cacheEnabled: true,
        //var marker,
        display: true,
        notificationCount: 0,
         currentPageH: ''
    }

    var markers= [] ;
    var map;
    var info;

    var markerPiker;
    var selectedLayerId
    const useSocketConncetion = false;

    PolygonbindTooltip = true;
    var errorMsgs


}else console.log("config.js")




const usersList = 'components/dashboards/admin/usersList';
const registerFragments = 'components/dashboards/admin/register';

const VehiculeList = 'components/dashboards/comn/vehicule/VehiculeList';
const addVehicule = 'components/dashboards/comn/vehicule/addVehicule';

const addAgent = 'components/dashboards/comn/agent/addAgent';
const agentList = 'components/dashboards/comn/agent/agentList';



const armList = 'components/dashboards/comn/arme/ArmeList';
const addArm = 'components/dashboards/comn/arme/addArme';


const munitionList = 'components/dashboards/comn/munition/munitionList';
const addMunition = 'components/dashboards/comn/munition/addMunition';

const materielList = 'components/dashboards/comn/materiel/materielList';
const addMateriel = 'components/dashboards/comn/materiel/addMateriel';

const brCnList = 'components/dashboards/comn/brigadeCanine/BrigadeCanineList';
const addBrCn = 'components/dashboards/comn/brigadeCanine/addBrigadeCanine';


const liveOp ='/osm/displayMarkers';
const addOpe = 'components/cx/addOperation';
const opList = 'operation/operationList';

const findInMap ='/osm/leafletSearch';

const stateDouane = 'components/charts/charts2';
const addInf ='/components/cx/addNewContarband';

const rapport2Fragment = 'components/create-rapport2';
function loadJsonMsgs() {

}


function err(msg) {
    console.error(msg)
}
