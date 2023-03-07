import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"

// Connects to data-controller="country"
export default class extends Controller {
  static targets = ["stateSelect"]
  static values = {
    url: String,
    param: String
  }

  change(event) {
    let params = new URLSearchParams()

    params.append( this.paramValue, event.target.selectedOptions[0].value )
    params.append( "target", this.stateSelectTarget.id )

    console.log(this.urlValue)

    get(this.urlValue + '/states?' + params, {
      responseKind: "turbo-stream"
    })
  }
}
