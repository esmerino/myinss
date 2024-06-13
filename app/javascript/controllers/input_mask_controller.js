import { Controller } from '@hotwired/stimulus'
import 'inputmask'

export default class extends Controller {
  static values = { type: String }

  connect () {
    this.initInputMask()
  }

  initInputMask () {
    const mask = this.masks(this.typeValue)
    const inputMask = new window.Inputmask(mask)
    inputMask.mask(this.element)
  }

  masks (maskType) {
    const masks = {
      currency: { alias: 'currency', radixPoint: ',' }
    }

    return masks[maskType]
  }
}
