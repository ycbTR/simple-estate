class Backend::BaseController < BaseController
  before_filter :authenticate_user!

  private

  def only_admin
    redirect_to root_path and return unless @current_user.admin?
  end

end