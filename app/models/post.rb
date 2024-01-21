class Post < ApplicationRecord
  has_rich_text :body
  belongs_to :user, counter_cache: true

  validates :title, presence: true
  validates :body, presence: true
end
