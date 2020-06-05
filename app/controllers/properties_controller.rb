class PropertiesController < ApplicationController

  before_action :find_property, only: [:edit,:update]

  def index
    @property = Property.new
  end

  def new
    
  end

  def create
    @property = Property.new(property_params)
    respond_to do |format|
       if @property.save
        format.html { redirect_to properties_path, notice: 'property was successfully created.' }
       else
        format.html { render :new }
       end
    end
  end

  def show
    
  end

  def edit
    
  end

  def update
    respond_to do |format|
     if @property_.update(property_params)
        format.html { redirect_to properties_path, notice: 'property was successfully updated.' }
     else
        format.html { render :edit }
     end
    end
  end

  def delete
    
  end


  private
    # Using a private method to encapsulate the permissible parameters
    # is just a good pattern since you'll be able to reuse the same
    # permit list between create and update. Also, you can specialize
    # this method with per-user checking of permissible attributes.
    def property_params
      params.require(:property).permit(:user_id,:monthly_rent,:security_deposit,:bedrooms,:bathrooms,:area_in_square_feet,:lease_duration,:detail_description,:lease_summary,:availabel_date,property_images: [])
    end

    def find_property
      @property = Property.find(params[:id])
    end
end