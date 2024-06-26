import { Controller } from "@hotwired/stimulus"
import { Chart, registerables } from "chart.js";
Chart.register(...registerables);

// Connects to data-controller="line-chart"
export default class extends Controller {
  static targets = ["stock"]

  // canvasContext() {
  //   return this.myChartTarget.getContext('2d');
  // }
  connect() {
    let STOCKS = []

    const url = "https://www.alphavantage.co/query?function=TIME_SERIES_WEEKLY&symbol=IBM&apikey=demo";

    fetch(url, {
      json: true,
      headers: { "Accept": 'application/json'}
    })
    .then(response => response.json())
    .then((data) => {
      const weeks = Object.entries(data["Weekly Time Series"]).slice(0, 5)
      weeks.forEach((week) => {
        const close = week["1"]["4. close"]
        STOCKS.push(Number(close))
      })

      const chart = document.getElementById("chart")

      new Chart(chart, {
        type: 'line',
        data: {
          labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
          datasets: [{
            label: '# of Votes',
            data: STOCKS,
            borderWidth: 1
          }]
        },
        options: {
          scales: {
            y: {
              beginAtZero: true
            }
          }
        }
      });
    });

  }

}



// "2024-03-28": {
//   "1. open": "190.2600",
//   "2. high": "191.9299",
//   "3. low": "188.5000",
//   "4. close": "190.9600",
//   "5. volume": "15383298"
// },
// "2024-03-22": {
//   "1. open": "191.7000",
//   "2. high": "193.9800",
//   "3. low": "190.0100",
//   "4. close": "190.8400",
//   "5. volume": "23968505"
// },
// "2024-03-15": {
//   "1. open": "195.0900",
//   "2. high": "199.1800",
//   "3. low": "190.7000",
//   "4. close": "191.0700",
//   "5. volume": "27466323"
// },
// "2024-03-08": {
//   "1. open": "187.7600",
//   "2. high": "198.7300",
//   "3. low": "187.6000",
//   "4. close": "195.9500",
//   "5. volume": "29085296"
// },
// "2024-03-01": {
//   "1. open": "185.6000",
//   "2. high": "188.3800",
//   "3. low": "182.6200",
//   "4. close": "188.2000",
//   "5. volume": "21955379"
// },
// "2024-02-23": {
//   "1. open": "187.6400",
//   "2. high": "188.7700",
//   "3. low": "178.7500",
//   "4. close": "185.7200",
//   "5. volume": "17487852"
// },
// "2024-02-16": {
//   "1. open": "185.9000",
//   "2. high": "188.9500",
//   "3. low": "182.2600",
//   "4. close": "187.6400",
//   "5. volume": "21745006"
// },
// "2024-02-09": {
//   "1. open": "185.5100",
//   "2. high": "187.1800",
//   "3. low": "181.4900",
//   "4. close": "186.3400",
//   "5. volume": "22784812"
// },
// "2024-02-02": {
//   "1. open": "187.4600",
//   "2. high": "189.4600",
//   "3. low": "182.7100",
//   "4. close": "185.7900",
//   "5. volume": "28283876"
// },
// "2024-01-26": {
//   "1. open": "172.8200",
//   "2. high": "196.9000",
//   "3. low": "172.4000",
//   "4. close": "187.4200",
//   "5. volume": "56232762"
// },
// "2024-01-19": {
//   "1. open": "165.8000",
//   "2. high": "171.5791",
//   "3. low": "165.0400",
//   "4. close": "171.4800",
//   "5. volume": "19864308"
// },
// "2024-01-12": {
//   "1. open": "158.6900",
//   "2. high": "165.9800",
//   "3. low": "157.8850",
//   "4. close": "165.8000",
//   "5. volume": "17643392"
// },
// "2024-01-05": {
//   "1. open": "162.8300",
//   "2. high": "163.2900",
//   "3. low": "158.6700",
//   "4. close": "159.1600",
//   "5. volume": "14822074"
// },
// "2023-12-29": {
//   "1. open": "162.2300",
//   "2. high": "164.1800",
//   "3. low": "162.0500",
//   "4. close": "163.5500",
//   "5. volume": "9376537"
// },
// "2023-12-22": {
//   "1. open": "162.2300",
//   "2. high": "163.3300",
//   "3. low": "159.5300",
//   "4. close": "162.1400",
//   "5. volume": "17686398"
// },
// "2023-12-15": {
//   "1. open": "162.6800",
//   "2. high": "166.3400",
//   "3. low": "160.1490",
//   "4. close": "162.2300",
//   "5. volume": "33504550"
// },
// "2023-12-08": {
//   "1. open": "160.2900",
//   "2. high": "162.7900",
//   "3. low": "159.9700",
//   "4. close": "161.9600",
//   "5. volume": "21918957"
// },
// "2023-12-01": {
//   "1. open": "154.9900",
//   "2. high": "160.5900",
//   "3. low": "154.7500",
//   "4. close": "160.5500",
//   "5. volume": "21900644"
// },
// "2023-11-24": {
//   "1. open": "152.5100",
//   "2. high": "155.7050",
//   "3. low": "152.3500",
//   "4. close": "155.1800",
//   "5. volume": "11362696"
// },
// "2023-11-17": {
//   "1. open": "148.4600",
//   "2. high": "153.5000",
//   "3. low": "147.3500",
//   "4. close": "152.8900",
//   "5. volume": "19547595"
// },
// "2023-11-10": {
//   "1. open": "147.8900",
//   "2. high": "149.6800",
//   "3. low": "145.2800",
//   "4. close": "149.0200",
//   "5. volume": "18357944"
// },
// "2023-11-03": {
//   "1. open": "143.1900",
//   "2. high": "148.4450",
//   "3. low": "142.5800",
//   "4. close": "147.9000",
//   "5. volume": "22959464"
