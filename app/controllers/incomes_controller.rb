class IncomesController < ApplicationController
  def index
    @item = Income.where(user: current_user)
    @total = @item.sum
    income = @item.sum(&:amount)
    @breakdown = FinanceCalculationsService.new.call(income,income)
    respond_to do |format|
      format.html { render partial: "shared/index", locals: { attribute: @item }, layout: false }
    end
  end

  def show
    @item = Income.find(params[:id])
    render "shared/_show", locals: { item: @item }
  end

  def new
    @income = Income.new
  end

  def create
    @income = Income.new(income_params)
    @income.user = current_user
    if @income.save
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @item = Income.find(params[:id])
    @item.destroy
    redirect_to dashboard_path
  end

  def edit
    @income = Income.find(params[:id])
  end

  def update
    @income = Income.find(params[:id])
    @income.update(income_params)
    # No need for app/views/restaurants/update.html.erb
    redirect_to income_path(@income)
  end


  private

  def income_params
    params.require(:income).permit(:name, :amount)
  end

  FinanceCalculationsService.new.call()

end
