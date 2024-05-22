class InvestmentsController < ApplicationController
  def new
    @investment = Investment.new
  end

  def create
    @investment = Investment.new(investment_params)
    @investment.user = current_user
    if @investment.save
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @investments = Investment.where(user: current_user)
    respond_to do |format|
      format.html { render partial: "shared/index", locals: { attribute: @investments }, layout: false }
    end
  end

  def show
    @item = Investment.find(params[:id])
    render "shared/_show", locals: { item: @item }
  end

  def chart
    @investment = Investment.find(params[:id])
  end

  def destroy
    @item = Investment.find(params[:id])
    @item.destroy
    redirect_to dashboard_path
  end

  def edit
    @investment = Investment.find(params[:id])
  end

  def update
    @investment = Investment.find(params[:id])
    @investment.update(investment_params)
    # No need for app/views/restaurants/update.html.erb
    redirect_to investment_path(@investment)
  end

  private

  def investment_params
    params.require(:investment).permit(:name, :quantity, :buy_price)
  end
end
