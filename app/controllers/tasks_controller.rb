class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy mark_as_done ]

  def index
    @tasks = Task.upcoming_deadline
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    result = CreateTask.new(params).call


    if result.success?
      redirect_to tasks_url, notice: 'Task successfully created'
    else
      flash.now[:alert] = result.failure
      render :new
    end
  end

  def update
    if params[:task].present? && @task.update(task_params)
      redirect_to root_path, notice: "Task was successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'Task successfully destroyed.'
  end

  def mark_as_done
    @task.realizations.create(done_at: Time.zone.now)
    redirect_back fallback_location: root_path, notice: 'Task Finished - well  done.'
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :deadline)
  end
end
