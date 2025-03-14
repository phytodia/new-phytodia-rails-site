import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl' // Don't forget this!

export default class extends Controller {
  static values = {
    apiKey: String
    //markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
      center: [7.73919,48.52608],
      zoom: 14
    })
    this.map.addControl(new mapboxgl.NavigationControl());
    this.addMarkersToMap()
  }

  addMarkersToMap() {
      new mapboxgl.Marker({
        color: "#51994b"
      })
        .setLngLat([7.7393615,48.5261933])
        .addTo(this.map)
  }
}
