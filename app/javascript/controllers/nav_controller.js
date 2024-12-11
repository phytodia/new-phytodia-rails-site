import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="nav"
export default class extends Controller {
  static targets = [ "burger" ]
  connect() {
  }
  toggle(){
    this.burgerTarget.classList.toggle("is-active")
  }
}
