class TasksController < ApplicationController
  def index
  end

  def list
    @tasks = Task.all
  end

  def show
    @tasks = Task.find(params[:id])
  end

  def new
    @tasks = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save

    redirect_to tasks_path(@task)
  end

  def edit
    @tasks = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)

    redirect_to tasks_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to tasks_path, status: :see_other
  end
end

private

def task_params
  params.require(:task).permit(:title, :details, :completed)
end
