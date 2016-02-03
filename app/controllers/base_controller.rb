class BaseController < ApplicationController
  before_action :set_current_user

  def set_current_user
    @current_user = current_user
    User.current = @current_user
  end

  private

  def only_admin
    redirect_to root_path and return unless @current_user.admin?
  end

end