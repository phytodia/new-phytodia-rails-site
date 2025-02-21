import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="blog"
export default class extends Controller {
  static targets = [ "summary","mainContent","linkSummary"]
  connect() {
    console.log("blog connected")
   //this.insertAnchorTitres()
  }
  mainContentTargetConnected(){
    this.insertAnchorTitres()
    this.linkSummaryTarget.parentElement.classList.add("anchor_selected")
  }

  insertAnchorTitres(){
    console.log("coucou 2")
    let anchorsSummary = Array.from(this.summaryTarget.querySelectorAll("li"))
    let h2Content = Array.from(this.mainContentTarget.querySelectorAll("h2"))
    console.log(anchorsSummary)
    console.log(h2Content)
    anchorsSummary.forEach((anchor)=>{
      console.log(anchor)
      let indexAnchor = anchorsSummary.indexOf(anchor)
      if(anchorsSummary[indexAnchor].innerText === h2Content[indexAnchor].innerText) {
        h2Content[indexAnchor].id = indexAnchor
      }
    })
  }
  clickLinkSummary(event){
    this.linkSummaryTargets.forEach((elt)=>{elt.parentElement.classList.remove("anchor_selected")})
    let indexLink = this.linkSummaryTargets.indexOf(event.currentTarget)
    this.linkSummaryTargets[indexLink].parentElement.classList.add("anchor_selected")
  }
}
