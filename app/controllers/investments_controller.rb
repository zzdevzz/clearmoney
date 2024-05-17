class InvestmentsController < ApplicationController
  def new
    @investment = Investment.new
  end

  def create
    @investment = Investment.new(investment_params)
    @investment.user = current_user
    if @investment.save
      redirect_to pages_path()
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

    render partial: "shared/show", locals: { item: @item }

  end

  def chart
    @investment = Investment.find(params[:id])
  end

  private

  def investment_params
    params.require(:investment).permit(:title, :amount)
  end
end
