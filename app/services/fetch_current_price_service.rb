require 'httparty'

response = HTTParty.get('https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=gbp')

puts response.body
