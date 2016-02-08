class Api::V1::SessionsController < Devise::SessionsController
  skip_before_filter :verify_authenticity_token
  acts_as_token_authentication_handler_for User
  skip_filter :verify_signed_out_user, only: :destroy
  respond_to :json
  rescue_from ActionController::ParameterMissing, :with => :missing_parameter

  def create
    warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    sign_in current_user
    render :status => 200,
           :json => { :response=> {:success => true,
                      :info => "Logged in",
                      :data => { :current_user => current_user,:auth_token => current_user.authentication_token },:status => 200} }
  end

  def destroy
    if current_user
      sign_out(current_user)
    end
    render :status => 200,
           :json => { :response=> {:success => true,
                      :info => "Logged out",
                      :data => {} }}
  end

  def failure
    render :status => 401,
           :json => { :response=> {:success => false,
                      :info => "Login Failed",
                      :data => {} }}
  end

  private

  def missing_parameter
    render(:json => {:response => {:success => false,
                                   :info => "Missing Parameter",
                                   :status => 400}}) and return

  end


end