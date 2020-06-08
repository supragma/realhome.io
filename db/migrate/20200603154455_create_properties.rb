class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.belongs_to :user
      t.integer   :monthly_rent
      t.integer   :security_deposit
      t.integer   :bedrooms
      t.integer   :bathrooms
      t.integer   :area_in_square_feet
      t.string    :lease_duration
      t.string    :detail_description
      t.string    :lease_summary
      t.string    :tour_availibility
      t.string    :address
      t.float     :longitude
      t.float     :latitude
      t.date      :availabel_date

      t.timestamps
    end
  end
end
