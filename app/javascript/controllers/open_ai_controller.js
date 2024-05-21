import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="open-ai"
export default class extends Controller {
  static targets = ["input", "results"]
  connect() {
    console.log("hello")
  }


  openAi() {
    // console.log(this.inputTarget.value)
    fetch("/open_ai", {
      method: "POST",
      // header: "Content-Type: application/json",
      body: JSON.stringify({"input": this.inputTarget.value})
    })
    .then((response) => {
      // Do something once HTTP response is received
      return response.json()
    }).then(data => {
      console.log(data)
      const div = this.resultsTarget
      div.innerHTML = ""
      div.insertAdjacentHTML("beforeend", `<p>${data}</p>`)

    })

  }
}
