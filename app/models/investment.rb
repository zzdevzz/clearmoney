class Investment < ApplicationRecord
  belongs_to :user

  def amount
    self.quantity
  end

  def title
    self.name
  end
end
