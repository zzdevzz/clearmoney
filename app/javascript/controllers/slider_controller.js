import { Controller } from "@hotwired/stimulus"
import { plugins } from "chart.js";
import { FinanceCalculationsService } from "../finance_calculations_service";


export default class extends Controller {

  static targets = ["input1", "chart", "textinput"]
  connect() {
    console.log("Controller connected.");
    this.financeService = new FinanceCalculationsService();
    this.updateChart()
  }

  updateChart() {
    const income = parseInt(this.input1Target.value)

    const results = this.financeService.call(income, income);
    new Chartkick.PieChart("myChart", {
      "Income Tax": results.incomeTax,
      "National Insurance": results.nationalInsurance,
      "Student Loan": results.studentLoan,
      "Disposable Income": results.disposableIncome
    }, {
      donut: true,
      library: {
        plugins: {
          legend: {
            labels: {
                color: 'white'       // Needed depending on the version of Chart.js
            }
          }
        }
      }
    });
    this.textinputTarget.textContent = `£${Number(this.input1Target.value).toLocaleString()}`;
}}
