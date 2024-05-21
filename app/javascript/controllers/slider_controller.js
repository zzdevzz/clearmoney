import { Controller } from "@hotwired/stimulus"


export default class extends Controller {

  static targets = ["input1", "input2", "input3", "chart"]
  connect() {
    console.log("hello")
    this.updateChart()
  }

  updateChart() {
    new Chartkick.PieChart("myChart", {
      "Income": parseInt(this.input1Target.value),
      "Investment": parseInt(this.input2Target.value),
      "Expenses": parseInt(this.input3Target.value)
    }, {
      donut: true,
      library: {
          legend: {
              labels: {
                  color: 'white'       // Needed depending on the version of Chart.js
              }
          }
      }
    });
}}
