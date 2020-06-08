# frozen_string_literal: true

class Users::PropertyAgentsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  prepend_before_action :user_signed_in?, only: [:new]
  # before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  # layout 'minimum'

  def new
    @user = User.new
    #super
  end

  def create
    #super
     super do |resource|
       resource.add_role :property_agent
     end
    respond_to do |format|
       format.html {}
     end
  end

  def edit
    super
  end

  def update
    super 
    # do |resource|
    #   if resource.f_name.present? && resource.l_name.present? && resource.contact_num.present?
    #     resource.add_role :property_agent
    #   end
    # end
  end

  protected

  def after_sign_up_path_for(resource)
    if current_user.is_property_agent?
      properties_path
    else
      root_path
    end
  end

    # def configure_sign_up_params
    #   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :f_name, :l_name, :contact_num).merge(property_agent: true) }
    # end

    # def configure_account_update_params
    #   devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :f_name, :l_name, :contact_num).merge(property_agent: true) }
    # end

    # def update_resource(resource, params)
    #   resource.update_without_password(params)
    # ends

    # def after_update_path_for(resource)
    #   new_business_path
    # end

    # def user_signed_in
    #   redirect_to edit_business_owner_path if user_signed_in?
    # end

end
 