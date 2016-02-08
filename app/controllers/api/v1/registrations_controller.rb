class Api::V1::RegistrationsController < Devise::RegistrationsController
  skip_before_filter :verify_authenticity_token
  skip_before_filter :authenticate_scope!
  acts_as_token_authentication_handler_for User, only: [:edit, :update, :destroy]

  respond_to :json
  rescue_from ActionController::ParameterMissing, :with => :missing_parameter

  def create
    build_resource(user_params)
    if resource.save
      sign_in resource
        render :status => 200,
           :json => { :response=> {:success => true,
                      :info => "Registered successfully.",
                      :data => { :user => resource,
                                 :token => current_user.authentication_token } } }
    else
      render :status => 422,
             :json => { :response=> {:success => false,
                        :info => resource.errors,
                        :data => {} } }
    end
  end

  def update
    @user = current_user
    if @user
      if @user.update_attributes(user_params)
        render :status => 200,
             :json => { :response=> {:success => true,
                        :info => "User Info Updated",
                        :data => {:user => @user },:status => 200, } }
      else
        render :status => 422,:json => { :response=> {:success => false,:info => @user.errors.full_messages.join(", "),:data => {} } }
      end
    else
      render :status => 404,:json => { :response=> {:success => false,:info => "You need to sign in or sign up to continue",:data => {} } }
    end  
  end

  private
  
    def user_params
     # Admin role validation implemented in User model
      params.require(:user).permit(:email, :password, :password_confirmation, :role, :firstname, :lastname, :description)
    end

  def missing_parameter
    render(:json => {:response => {:success => false,
                                   :info => "Missing Parameter",
                                   :status => 400}}) and return

  end


end