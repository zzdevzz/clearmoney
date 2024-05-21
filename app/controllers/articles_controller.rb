class ArticlesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    if params[:query].present?
      @articles = Article.search_by_title_and_description(params[:query])
    else
      @articles = Article.all
    end
  end

  def open_ai
    request_data = JSON.parse(request.body.read)
    client = OpenAI::Client.new
    response = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{ role: "user", content: "#{request_data['input']}"}]

    })
    render json: response.dig('choices', 0, 'message', 'content').to_json
  end
end
