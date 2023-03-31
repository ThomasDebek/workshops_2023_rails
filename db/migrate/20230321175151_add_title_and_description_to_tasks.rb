class AddTitleAndDescriptionToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :title, :string
    add_column :tasks, :description, :text
  end
end
