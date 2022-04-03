// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";

require("jquery");
require("bootstrap");
require("packs/bootstrap-datetimepicker.min")
require("@fortawesome/fontawesome-free/css/all.css");
require("packs/sidebar.js");

require("packs/app.min.js");
const images = require.context("../images", true);

require('parsleyjs');
require('fabric');
require('jquery.blockUI.min.js')
import 'bootstrap-datepicker';
import "../stylesheets/application";
import "select2";
import "select2/dist/css/select2.css";
window.$ = $;

Rails.start();
Turbolinks.start();
ActiveStorage.start();
