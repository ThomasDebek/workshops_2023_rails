require 'dry-monads'

class DeleteTask
  include Dry::Monads[:result]

  def initialize(task)
    @task = task
  end

  def call
    if task.destroy
      Success(task)
    else
      Failure(task.errors.full_messages.join(", "))
    end
  end

  private

  attr_reader :task
end
