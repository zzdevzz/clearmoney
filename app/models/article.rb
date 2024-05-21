class Article < ApplicationRecord
  # validates :title, presence: true
  # validates :description, presence: true
  # validates :url, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_title_and_description,
    against: [ :title, :description ],
    using: {
      tsearch: { prefix: true }
    }
end
