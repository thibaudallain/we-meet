import "bootstrap";
import { share } from "../components/share";
import { multipleForm } from "../components/multipleForm";
import { vote } from "../components/vote";
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from "../plugins/init_mapbox"
share();
multipleForm();
vote();
initMapbox();
