import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"

// Connects to data-controller="country"
export default class extends Controller {
  static targets = ["citySelect"]
  static values = {
    url: String,
    param: String
  }

  change(event) {
    let params = new URLSearchParams()

    params.append( this.paramValue, event.target.selectedOptions[0].value )
    params.append( "target", this.citySelectTarget.id )

    console.log(this.urlValue)
    console.log(this.paramValue)  
    console.log(this.citySelectTarget.id)

    get(this.urlValue + '/cities?' + params, {
      responseKind: "turbo-stream"
    })
  }
}
