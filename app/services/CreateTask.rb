require 'dry-monads'

class CreateTask
  include Dry::Monads[:result]

  def initialize(params)
    @params = params
  end

  def call
    task = Task.new(task_params)

    if task.save
      Success(task)
    else
      Failure(task.errors.full_messages.join(", "))
    end
  end

  private

  attr_reader :params

  def task_params
    params.require(:task).permit(:title, :description, :deadline)
  end
end
