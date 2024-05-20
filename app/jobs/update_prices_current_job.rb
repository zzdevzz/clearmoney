class UpdatePricesCurrentJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Investment.all.each do |investment|
      current_price = FetchCurrentPriceService.new.price_current(investment.name)
      investment.update(current_price: current_price)
    end
  end
end
