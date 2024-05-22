class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about_us ]

  def home
  end

  def new
  end

  def show

  end

  def about_us

  end

  def dashboard
    @user = current_user
    @incomes = @user.incomes
    @savings = @user.savings
    @expenses = @user.expenses
    @debts = @user.debts
    @investments = @user.investments
    @goals = @user.goals
    @item = [@incomes, @savings, @expenses, @debts, @investments, @goals]
    @yearly = [@incomes, @expenses]
    @fixed = [@savings, @debts, @investments, @goals]
  end
end
