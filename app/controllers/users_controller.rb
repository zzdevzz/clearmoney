class UsersController < ApplicationController
  # def show
  #   user = User.find(params[:id])
  #   @example = user.investments
  # end

  def index
    @item = User.where(user: current_user)
    respond_to do |format|
      format.html { render partial: "shared/index", locals: { attribute: @item }, layout: false }
    end
  end
end
