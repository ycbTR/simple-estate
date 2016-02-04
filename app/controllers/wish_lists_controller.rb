class WishListsController < ApplicationController
  before_action :set_wish_list, only: [:show, :edit, :update, :destroy]

  # GET /wish_lists
  # GET /wish_lists.json
  def index
    @wish_lists = @current_user.wish_lists.page(params[:page])
  end

  # PATCH/PUT /wish_lists/1
  # PATCH/PUT /wish_lists/1.json
  def update
    respond_to do |format|
      if @wish_list.update(wish_list_params)
        format.html { redirect_to @wish_list, notice: 'Wish list was successfully updated.' }
        format.json { render :show, status: :ok, location: @wish_list }
      else
        format.html { render :edit }
        format.json { render json: @wish_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wish_lists/1
  # DELETE /wish_lists/1.json
  def destroy
    @wish_list.destroy
    respond_to do |format|
      format.html { redirect_to wish_lists_url, notice: 'Wish list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_wish_list
    @wish_list = WishList.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def wish_list_params
    params.require(:wish_list).permit(:user_id, :property_id)
  end
end
