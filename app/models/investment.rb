class Investment < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :but_price, presence: true
  validates :quantity, presence: true
  validates :amount, presence: true
  validates :buy_date, presence: true

  before_create :set_info_current, :calculate_amount, :set_info_history
  before_save :calculate_amount

  def calculate_amount
    if quantity.present? && price_current.present?
      self.amount = quantity * price_current
    else
      self.amount = 0
    end
  end

  def set_info_current
    self.price_current = FetchCurrentPriceService.new.price_current(self.name)
  end

  def set_info_history
    self.price_history = FetchCurrentPriceService.new.price_history(self.name)
  end
end
