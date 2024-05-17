import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["input1", "input2", "input3", "chart"]
  connect() {
    console.log("hello")
    this.updateChart()
  }

  updateChart() {
    new Chartkick.PieChart("myChart", {
      "Value 1": parseInt(this.input1Target.value),
      "Value 2": parseInt(this.input2Target.value),
      "Value 3": parseInt(this.input3Target.value)
    }, {donut: true});
  }
}
