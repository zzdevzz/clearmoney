class SavingsController < ApplicationController

  def index
    @savings = Saving.where(user: current_user)
    respond_to do |format|
      format.html { render partial: "shared/index", locals: { attribute: @savings }, layout: false }
    end
  end
end
