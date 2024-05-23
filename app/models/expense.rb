class Expense < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  # validates :category, presence: true
  validates :input_amount, presence: true
  def title
    name
  end

  before_save :calculate_amount

  def calculate_amount
    self.amount = self.occurs_monthly ? self.input_amount * 12 : self.input_amount
  end
end
