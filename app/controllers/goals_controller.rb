class GoalsController < ApplicationController
  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user = current_user
    if @goal.save
      redirect_to pages_path()
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @goals = Goal.where(user: current_user)
    respond_to do |format|
      format.html { render partial: "shared/index", locals: { attribute: @goals }, layout: false }
    end
  end

  def show
    @item = Goal.find(params[:id])
    render partial: "shared/show", locals: { item: @item }
  end

  private

  def goal_params
    params.require(:goal).permit(:title, :amount, :notes, :date_by)
  end
end
