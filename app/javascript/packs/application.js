import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

//= require jquery3
//= require popper
//= require bootstrap

Rails.start()
Turbolinks.start()
ActiveStorage.start()
