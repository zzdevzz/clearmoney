class SavingsController < ApplicationController

  def index
    @savings = Saving.where(user: current_user)
    respond_to do |format|
      format.html { render partial: "shared/index", locals: { attribute: @savings }, layout: false }
    end
  end

  def show
    @item = Saving.find(params[:id])
    render "shared/_show", locals: { item: @item }
  end

  def destroy
    @item = Saving.find(params[:id])
    @item.destroy
    redirect_to dashboard_path
  end
end
