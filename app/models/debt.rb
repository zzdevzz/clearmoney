class Debt < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :amount, presence: true
  # validates :interest, presence: true
  # validates :notes, presence: true
  # validates :pay_by, presence: true
end
