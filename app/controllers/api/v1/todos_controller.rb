class Api::V1::TodosController < Application_controller
  def index
    todos = Todo.order(update_at: desc)
    render json: todos #todosがjson形式で返される
  end

  def show
    todo = Todo.find(params[:id])
    render json: todo
  end

  def create
    todo = Todo.new(todo_params)
    if todo.save
      render json: todo
    else
      render json: todo.errors, status: 422
    end
  end

  def update
    todo = Todo.find(params[:id])
    if todo.update(todo_params)
      render json: todo
    else
      render json: todo.errors, status: 422
    end
  end

  def destroy
    if Todo.destory(params[:id])
      head :no_content ##特に返すものがない
    else
      render json: { error: "Failed to destroy" }, status: 422
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:name, :is_completed)
  end
end