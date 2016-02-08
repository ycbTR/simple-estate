# app/controllers/users/registrations_controller.rb
class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters

  protected

  def configure_permitted_parameters
    (params[:user][:role] = "Customer" if params[:user][:role] == 'Admin') rescue ''
    devise_parameter_sanitizer.for(:sign_up).push(:role, :firstname, :lastname, :description)
    devise_parameter_sanitizer.for(:account_update).push(:firstname, :lastname, :description)
  end

end
