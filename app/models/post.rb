class Post < ApplicationRecord
  has_rich_text :body
  has_many_attached :images, dependent: :purge_later
  belongs_to :user, counter_cache: true
  after_commit :send_img_to_django

  validates :title, presence: true
  validate :body_length_validate
  #validates :body, presence: true

  private

  def body_length_validate
    if self.body.to_plain_text.length < 5
      errors.add(:body, '본문의 글자 수는 최소 6글자 이상이어야 합니다.')
      #binding.b
    end
  end

  # 외부 api로 요청 보내는용도
  def send_img_to_django
    return unless previous_changes.any?  # 변경 사항이 있을 때만 실행
    # image_url = Rails.application.routes.url_helpers.url_for(images.last) if images.attached?
    # ActiveStorage에서 첨부된 모든 이미지의 URL을 배열로 가져옵니다.
    image_urls = images.map { |img| Rails.application.routes.url_helpers.url_for(img) } if images.attached?


    # HTTParty로 외부 API로 데이터를 전송합니다.
    HTTParty.post("https://example.com/api/webhook", 
      body: { 
        post_id: self.id, 
        image: image_urls
      }.to_json,
      headers: { 'Content-Type' => 'application/json' }
      )
    end

end