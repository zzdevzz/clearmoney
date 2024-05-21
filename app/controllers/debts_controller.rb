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
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end

  end

  def index
    @debts = Debt.where(user: current_user)
    respond_to do |format|
      format.html { render partial: "shared/index", locals: { attribute: @debts }, layout: false }
    end
  end

  def show
    @item = Debt.find(params[:id])
    render "shared/_show", locals: { item: @item }
  end

  private

  def debt_params
    params.require(:debt).permit(:company_name, :amount, :notes, :interest, :pay_by)
  end
end
