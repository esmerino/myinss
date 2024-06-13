import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"

export default class extends Controller {
  static targets = ["salary"]

  calculate() {
    const salaryValue = this.salaryTarget.value;
    
    const url = `/calculators?salary=${encodeURIComponent(salaryValue)}`
    get(url, { responseKind: "turbo-stream" })
  }
}
