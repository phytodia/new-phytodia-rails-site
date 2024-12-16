import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="accordeon"
export default class extends Controller {
  static targets = ["expand"]
  connect() {
  }
  toggle(event){
    this.expandTargets.forEach((element)=>{
      element.classList.remove("open")
    })
    event.currentTarget.nextElementSibling.classList.add("open")
  }
}
