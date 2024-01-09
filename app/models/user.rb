class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable, 
         :omniauthable, omniauth_providers: [:google_oauth2] 


  def self.from_omniauth(access_token)
    user = User.where(email: access_token.info.email).first
    # Uncomment the section below if you want users to be created if they don't exist
    unless user
      user = User.create(
        email: access_token.info.email,
        provider: access_token.provider,
        name: access_token.info.name,
        image: access_token.info.image,
        password: Devise.friendly_token[0,20]
      )
    end
    user
  end
  def username
    if name?
      name
    else
      email.split('@').first
    end
  end
end
