class ExpensesController < ApplicationController

  def index
    @expenses = Expense.all
  end

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

  private

  def expense_params
    params.require(:expense).permit(:name, :amount, :category,)
  end

end






t.string "name"
t.string "category"
t.float "amount"
