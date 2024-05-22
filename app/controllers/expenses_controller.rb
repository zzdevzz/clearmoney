class ExpensesController < ApplicationController
  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.user = current_user
    if @expense.save
      redirect_to dashboard_path
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

  def show
    @item = Expense.find(params[:id])
    render "shared/_show", locals: { item: @item }
  end

  def destroy
    @item = Expense.find(params[:id])
    @item.destroy
    redirect_to dashboard_path
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def update
    @expense = Expense.find(params[:id])
    @expense.update(expense_params)
    # No need for app/views/restaurants/update.html.erb
    redirect_to expense_path(@expense)
  end


  private

  def expense_params
    params.require(:expense).permit(:name, :amount, :category)
  end

end
