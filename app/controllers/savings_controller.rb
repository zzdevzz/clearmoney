class SavingsController < ApplicationController

  def new
    @saving = Saving.new
  end

  def create
    @saving = Saving.new(saving_params)
    @saving.user = current_user
    if @saving.save
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end


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

  def edit
    @saving = Saving.find(params[:id])
  end

  def update
    @saving = Saving.find(params[:id])
    @saving.update(saving_params)
    # No need for app/views/restaurants/update.html.erb
    redirect_to saving_path(@saving)
  end

  private

  def saving_params
    params.require(:saving).permit(:name, :amount)
  end
end
