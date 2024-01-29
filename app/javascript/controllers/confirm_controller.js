// app/javascript/controllers/confirm_controller.js
import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="confirm"
export default class extends Controller {
  static targets = ["button"]

  connect() {
    console.log("confirm is connected");
    // This will be called when the controller is connected to the DOM
  }

  confirm(event) {
    // Prevent the button from submitting the form immediately
    event.preventDefault();

    // Confirm dialog with the user
    if (window.confirm("삭제된 게시물은 복구가 불가능합니다. 정말로 삭제 하시겠습니까?")) {
      // If the user confirms, submit the form associated with the button
      this.buttonTarget.form.submit();
    }
  }
}