class IncomesController < ApplicationController

  def index
    @incomes = Income.all
  end

  def new
    @income = Income.new
  end

  def create
    @income = Income.new(income_params)
    @income.user = current_user
    if @income.save
      redirect_to pages_path()
    else
      render :new, status: :unprocessable_entity
    end

  end

  private

  def income_params
    params.require(:income).permit(:name, :amount)
  end


end
