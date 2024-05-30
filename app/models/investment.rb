class Investment < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :buy_price, presence: true
  validates :quantity, presence: true
  # validates :amount, presence: true

  before_create :downcase_fields, :set_info_current, :calculate_amount, :set_info_history
  before_save :calculate_amount

  def downcase_fields
    self.name.downcase!
  end

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
