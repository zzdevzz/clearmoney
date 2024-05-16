class Saving < ApplicationRecord
  belongs_to :user

  def title
    self.name
  end
end
