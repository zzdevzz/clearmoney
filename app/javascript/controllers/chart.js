const request = require('request');

const url = 'https://www.alphavantage.co/query?function=TIME_SERIES_WEEKLY&symbol=IBM&apikey=HGXNGTMUXDORXGQM';

request.get({
  url: url,
  json: true,
  headers: {'User-Agent': 'request'}
}, (err, res, data) => {
  if (err) {
    console.log('Error:', err);
  } else if (res.statusCode !== 200) {
    console.log('Status:', res.statusCode);
  } else {
    // data is successfully parsed as a JSON object:
    console.log(data);
  }
});


// fetch('/path_to_your_api_endpoint')
//   .then(response => response.json())
//   .then(data => {
//     // Handle the JSON data here
//     console.log(data);
//   })
//   .catch(error => {
//     // Handle any errors here
//     console.error('Error fetching data: ', error);
//   });


// fetch('/your_api_endpoint', {
//   method: 'GET',
//   headers: {
//     'Content-Type': 'application/json',
//     // Add other headers here
//     'X-Requested-With': 'XMLHttpRequest',
//     'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
//   },
//   body: JSON.stringify({
//     key: 'value'
//     // Your JSON data here
//   })
// })
// .then(response => response.json())
// .then(data => { console.log(data);
// })
// .catch(error => {
//   // Handle any errors here
//   console.error('Error:', error);
// });
//   // Handle the JSON data here
