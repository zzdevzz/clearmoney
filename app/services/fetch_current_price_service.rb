require 'httparty'

class FetchCurrentPriceService
  include HTTParty
  base_uri 'https://api.coingecko.com/api/v3'

  def price_current(name)
    response = self.class.get("/simple/price", query: { ids: name.downcase, vs_currencies: "gbp" })
    response.values.first.values.first #format the response to always get the number instead.
  end

  def price_history(name)
    p response = self.class.get("/coins/#{name.downcase}/market_chart", query: {vs_currency: "gbp", days: 90, interval: "daily"})
    prices = response["prices"]
    formatted = {} # Set in a hash so we can use with chartkick
    prices.each do |array|
      timestamp = array[0]/1000 # Convert from milliseconds to seconds
      date = Time.at(timestamp).utc.strftime("%Y-%m-%d") # Gets the date and sets to be used with active record
      formatted[date] = array[1].round(2)
    end
    formatted
  end

  def price_history_raw(name)
    response = self.class.get("/coins/#{name.downcase}/market_chart", query: {vs_currency: "gbp", days: 10, interval: "daily"})
  end
end
