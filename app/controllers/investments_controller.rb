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

  private

  def investment_params
    params.require(:investment).permit(:title, :amount)
  end

end
