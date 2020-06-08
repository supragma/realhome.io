class Property < ApplicationRecord
  has_many_attached :property_images
  belongs_to :user
  geocoded_by :full_address
  after_validation :geocode

  def full_address
    self.address
  end
end
