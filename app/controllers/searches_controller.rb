class SearchesController < ApplicationController
  protect_from_forgery

  def search
    keyword = params[:keyword]
    @todos = Todo.where("name LIKE?","%#{keyword}%")
    render json: @todos
  end
end
