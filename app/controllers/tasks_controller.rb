class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path()
  end

  def update
    @task = Task.find(params[:id])
    @tasks.update(task_params)
    redirect_to tasks_path(@task) # show page
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
