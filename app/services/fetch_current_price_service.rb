require 'httparty'

class FetchCalculationsSerivce
  include HTTParty
  base_uri 'https://api.coingecko.com/api/v3'

  def current_price(name)
    self.class.get("/simple/price", query: { ids: name, vs_currencies: "gbp" })
  end

  def price_history(name)
    self.class.get("/coins/#{name}/market_chart", query: {vs_currency: "gbp", days: 90, interval: "daily"})
  end
end

# response = HTTParty.get('https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=gbp')

FetchCalculationsSerivce.new.current_price("bitcoin")
FetchCalculationsSerivce.new.price_history("bitcoin")
