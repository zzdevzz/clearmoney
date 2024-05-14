class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def educational_resources

  end

  def Dashboard
  end
end
