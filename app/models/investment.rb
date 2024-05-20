class Investment < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :but_price, presence: true
  validates :quantity, presence: true
  validates :amount, presence: true
  validates :buy_date, presence: true
  # def amount
  #   self.quantity
  # end

  def title
    self.name
  end

  before_save :calculate_amount
  before_create :calculate_amount

  def calculate_amount
    self.amount = quantity * buy_price
  end
end
