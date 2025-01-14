import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="accordeon"
export default class extends Controller {
  static targets = ["expand","horizontal"]
  connect() {
  }
  toggle(event){
    this.expandTargets.forEach((element)=>{
      element.classList.remove("open")
    })
    event.currentTarget.nextElementSibling.classList.add("open")
  }
  toggleHorizontal(event){
    event.currentTarget.classList.toggle("open")
    event.currentTarget.nextElementSibling.classList.toggle("open")
    Array.from(event.currentTarget.getElementsByTagName('span')[0].getElementsByTagName('img')).forEach((img)=>{
      img.classList.toggle('visible')
    })
  }
}
