class UpdatePricesHistoryJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Investment.all.each do |investment|
      current_price = FetchCurrentPriceService.new.price_history(investment.name)
      investment.update(current_price: current_price)
    end
  end
end
