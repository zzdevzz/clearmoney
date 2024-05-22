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


  def destroy
    @item = Debt.find(params[:id])
    @item.destroy
    redirect_to dashboard_path
  end

  def edit
    @debt = Debt.find(params[:id])
  end

  def update
    @debt = Debt.find(params[:id])
    @debt.update(debt_params)
    # No need for app/views/restaurants/update.html.erb
    redirect_to debt_path(@debt)
  end

  private

  def debt_params
    params.require(:debt).permit(:name, :amount, :notes, :interest, :pay_by)
  end
end
