import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="delete-message"
export default class extends Controller {
  connect() {
    //console.log("delete-message is connected");
  }
  dismiss() {
    this.element.remove();
  }
  // fetch('/users/dismiss_flash', {
  //   method: 'DELETE',
  //   headers: {
  //     'X-CSRF-Token': document.querySelector("[name='csrf-token']").content
  //   }
  // });
}
