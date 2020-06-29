class Property < ApplicationRecord
  has_many_attached :property_images
  belongs_to :user
end
