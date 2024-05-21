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
    user = current_user
    @goals = user.goals
    @investments = Investment.where(user: current_user)
  end
end
