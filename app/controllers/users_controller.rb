class UsersController < BaseController

  def show
    @user = User.includes(:properties).find params[:id]
  end

end