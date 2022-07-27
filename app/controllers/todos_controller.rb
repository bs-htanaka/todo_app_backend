class TodosController < ApplicationController
  before_action :set_todo, only: %i[ show edit update destroy ]
  protect_from_forgery

  # GET /todos or /todos.json
  def index
    @todos = Todo.all
    render json: @todos
  end

  # GET /todos/1 or /todos/1.json
  def show
  end

  # GET /todos/new
  def new
    @todo = Todo.new
  end

  # GET /todos/1/edit
  def edit
  end

  # POST /todos or /todos.json
  def create
    @todo = Todo.new(todo_params)
    @todo.save
    render json: @todos
  end

  # PATCH/PUT /todos/1 or /todos/1.json
  def update
    set_todo
    @todo.update(todo_params)
    render json: @todos
  end

  # DELETE /todos/1 or /todos/1.json
  def destroy
    @todo.destroy

    render json: @todos
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def todo_params
      params.require(:todo).permit(:name)
    end
end
