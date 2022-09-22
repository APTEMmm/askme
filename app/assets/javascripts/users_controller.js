import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ['picker']
    reset_header_color() {
        this.pickerTarget.value = '#370617';
    }
}