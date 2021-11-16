class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.create(task_params)
    @task.save
    redirect_to tasks_path(@task)
  end

  def new
    @task = Task.new
  end

  def destroy
    Task.find(params[:id]).destroy
    redirect_to tasks_path(@task)
  end

private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
