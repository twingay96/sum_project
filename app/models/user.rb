class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first
    #user = User.where(email: data['email']).first_or_initialize
    # Uncomment the section below if you want users to be created if they don't exist
    unless user
      user = User.create(
        email: data['email'],
        password: Devise.friendly_token[0,20]
      )
    end
    # if user.new_record?
    #   user.name = data['name']
    #   user.password = Devise.friendly_token[0,20]
    #   user.save! # 유효성 검사에 실패하면 예외가 발생합니다.
    # end
    user
  end
end
