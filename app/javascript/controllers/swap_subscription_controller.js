import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="swap-subscription"
export default class extends Controller {
  static values = { swapId: Number }
  static targets = ["messages"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "SwapChannel", id: this.swapIdValue },
      { received: message => this.#insertMessageAndScrollDown(message) }
    )
  }

  resetForm(event) {
    event.target.reset()
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }

  #insertMessageAndScrollDown(data) {
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }
}
