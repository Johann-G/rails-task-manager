class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to @task #pas besoin de préciser 'redirect_to task_path(@task.id)', rails comprend automatiquement qu'il doit chercher l'id de @task
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update 
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to @task
  end

  def destroy 
    @task = Task.find(params[:id])
    @task.destroy 
    redirect_to tasks_path #pas besoin de préciser 'redirect_to task_path(@task.id)', rails comprend automatiquement qu'il doit chercher l'id de @task
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
