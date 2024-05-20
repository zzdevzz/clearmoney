class Saving < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :amount, presence: true
  

  def title
    self.name
  end
end
