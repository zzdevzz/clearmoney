class IncomesController < ApplicationController

  # def index
  #   @incomes = Income.where(user: current_user)
  # end
  def index
    @incomes = Income.where(user: current_user)
    respond_to do |format|
      format.html { render partial: "shared/index", locals: { attribute: @incomes }, layout: false }
    end
  end

  def show
    @item = Income.find(params[:id])

    render partial: "shared/show", locals: { item: @item }
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

  def destroy
    @item = incomes.find(params[:id])
    @item.destroy
    redirect_to dashboard_path
  end


  private

  def income_params
    params.require(:income).permit(:name, :amount)
  end


end
