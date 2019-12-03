import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import { share } from "../components/share";
import { multipleForm } from "../components/multipleForm";
import { vote } from "../components/vote";
import { initMapbox } from "../plugins/init_mapbox";
import { initAutocomplete } from "../plugins/init_autocomplete";
import { validateForm } from "../components/formValidation";
import { initAutocompleteMeeting } from "../plugins/init_autocomplete_meeting";
import { loadScreen } from "../components/loadingScreen";
import { slideForm } from "../components/slidingForm";
import { slideInvite } from "../components/slidingInvite";
import { initActionCable } from "../plugins/init_action_cable";

share();
multipleForm();
vote();
initMapbox();
if (document.querySelector("#address")) {
  initAutocomplete();
}
if (document.querySelector("#meeting_address")) {
  initAutocompleteMeeting();
}
if (document.getElementById('name')) {
   validateForm();
}

if (document.getElementById('loading-screen')) {
  setTimeout(loadScreen, 1000);
}

if (document.querySelector('.label-deadline')) {
  slideForm();
}

if (document.querySelector('#invite-arrow-1')) {
  slideInvite();
}

initActionCable();


