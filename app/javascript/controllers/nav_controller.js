import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="nav"
export default class extends Controller {
  static targets = [ "burger","menu_mobile" ]
  connect() {
  }
  toggle(){
    this.burgerTarget.classList.toggle("is-active")
    this.menu_mobileTarget.classList.toggle("is-active")
  }
}
