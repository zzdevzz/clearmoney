class ArticlesController < ApplicationController

  def index
    if params[:query].present?
      @articles = Article.search_by_title_and_description(params[:query])
    else
      @articles = Article.all
    end
  end

  def open_ai
    client = OpenAI::Client.new
    @response = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{ role: "user", content: "#{params[:input]}"}]
    })
  end
end
