class DebtsController < ApplicationController

  def index
    @debts = Debt.where(user: current_user)
  end

  def new
    @debt = Debt.new
  end


  def create
    @debt = Debt.new(debt_params)
    @debt.user = current_user
    if @debt.save
      redirect_to pages_path()
    else
      render :new, status: :unprocessable_entity
    end

  end

  private

  def debt_params
    params.require(:debt).permit(:company_name, :amount, :notes, :interest, :pay_by)
  end
end
