class TodoItemsController < ApplicationController
before_action :set_todo_list

def create
  @todo_item = @todo_list.todo_items.create(todo_items_params)
  redirect_to @todo_list
end

def destroy
  @todo_item = @todo_list.todo_items.find(params[:id])
  if @todo_item.destroy
    flash[:success] = "Todo Item successfully deleted"
  else
    flash[:error] = "Todo Item couldn't be deleted"
  end
  redirect_to @todo_list
end


private

def todo_items_params
  params[:todo_item].permit(:content)
end


def set_todo_list
  @todo_list = TodoList.find(params[:todo_list_id])
end
end
