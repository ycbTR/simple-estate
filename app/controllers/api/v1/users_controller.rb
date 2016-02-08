class Api::V1::UsersController < Api::V1::BaseController

  def show
    @user = User.find params[:id]

    render(:json => {:response => {:success => true,
                                   :info => "User details",
                                   data: {user: @user },:status => 200}}) and return

  end

  def properties
    @user = User.includes(:properties).find params[:id]

    render(:json => {:response => {:success => true,
                                   :info => "Properties",
                                   data: {properties: @user.properties },:status => 200}}) and return

  end


end