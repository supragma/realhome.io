class Property < ApplicationRecord
  has_many_attached :property_images
  belongs_to :user
  geocoded_by :full_address
  after_validation :geocode

  def full_address
    self.address
  end
  def google_map(center)
    # "https://maps.googleapis.com/maps/api/staticmap?center=#{center}&size=300x300&zoom=17"
    "http://maps.googleapis.com/maps/api/staticmap?center=#{center}&markers=#{center}&zoom=15&size=640x400&key=AIzaSyBao0kOCqbC72yfqXUwN14QhBrSZbXHRWo"
  end
end
