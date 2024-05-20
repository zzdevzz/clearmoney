class Investment < ApplicationRecord
  belongs_to :user

  before_create :set_info, :calculate_amount
  before_save :calculate_amount

  def calculate_amount
    if quantity.present? && price_current.present?
      self.amount = quantity * price_current
    else
      self.amount = 0
    end
  end

  def set_info
    p self.price_current = FetchCurrentPriceService.new.price_current(self.name)
    # p self.price_history = FetchCurrentPriceService.new.price_history(self.name)
  end
end
