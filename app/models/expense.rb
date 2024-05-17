class Expense < ApplicationRecord
  belongs_to :user
  def title
    name
  end
end
