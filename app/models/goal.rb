class Goal < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :amount, presence: true
  validates :notes, presence: true
  # validates :date_by, presence: true

end
