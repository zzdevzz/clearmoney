class ExpensesController < ApplicationController

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.user = current_user
    if @expense.save
      redirect_to pages_path()
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @expenses = Expense.where(user: current_user)
    respond_to do |format|
      format.html { render partial: "shared/index", locals: { attribute: @expenses }, layout: false }
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount, :category)
  end

end
