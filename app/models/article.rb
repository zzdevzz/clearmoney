class Article < ApplicationRecord
  # validates :title, prescence: true
  # validates :description, prescence: true
  # validates :url, prescence: true

  include PgSearch::Model
  pg_search_scope :search_by_title_and_description,
    against: [ :title, :description ],
    using: {
      tsearch: { prefix: true }
    }
end
