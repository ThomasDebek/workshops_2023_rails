require 'dry-monads'

class UpdateTask
  include Dry::Monads[:result]

  def initialize(task, params)
    @task = task
    @params = params
  end

  def call
    if task.update(task_params)
      Success(task)
    else
      Failure(task.errors.full_messages.join(", "))
    end
  end

  private

  attr_reader :task, :params

  def task_params
    params.require(:task).permit(:title, :description, :deadline)
  end
end
