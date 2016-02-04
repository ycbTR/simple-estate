module Backend
  class WishListsController < Backend::BaseController
    before_action :set_wish_list, only: [:show, :edit, :update, :destroy]

    def index
      @search = @current_user.wish_lists.includes(:property).group(:property_id).ransack params[:q]
      @wish_lists = @search.result(distinct: true).page(params[:page])
    end

  end
end
