class Post < ApplicationRecord
  has_rich_text :body
  has_many_attached :images
  belongs_to :user, counter_cache: true

  validates :title, presence: true
  validate :body_length_validate
  #validates :body, presence: true

  private

  def body_length_validate
    if self.body.to_plain_text.length < 5
      errors.add(:body, '본문의 글자 수는 최소 6글자 이상이어야 합니다.')
    end
  end
end
