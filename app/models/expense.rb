class Expense < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  # validates :category, presence: true
  validates :amount, presence: true
  def title
    name
  end
end
