class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :properties
  
  def is_property_agent?
    has_role? :property_agent
  end

  def is_seller?
    has_role? :seller
  end

end
