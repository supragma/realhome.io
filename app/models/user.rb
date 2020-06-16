class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :lockable, :timeoutable,
          :omniauthable, omniauth_providers: [:facebook,:google_oauth2]
  has_many :properties

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do | user |
      user.email = provider_data.info.email
      user.name = provider_data.info.name
      user.password = "salman"
      user.image = provider_data.info.image
      # user.skip_confirmation! Devise.friendly_token[0, 20]
    end
  end
  
  def is_property_agent?
    has_role? :property_admin
  end

  def is_seller?
    has_role? :seller
  end

end
