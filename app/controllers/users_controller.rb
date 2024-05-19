class UsersController < ApplicationController
  # def show
  #   @user = User.find(params[:id])
  #   @example = @user.investments
  # end

  def show
    @user = current_user
    @incomes = @user.incomes
    @savings = @user.savings
    @expenses = @user.expenses
    @debts = @user.debts
    @investments = @user.investments
    @goals = @user.goals
    @item = [@incomes, @savings, @expenses, @debts, @investments, @goals]

    respond_to do |format|
      format.html { render partial: "shared/index2", locals: { attribute: @item }, layout: false }
    end
  end

end
