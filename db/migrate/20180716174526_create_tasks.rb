class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|

      t.string :title
      t.string :body
      t.date :due_date
      t.integer :project_id, :null => false, :references => [:projects, :id]
      t.string :images
      t.timestamps
    end
  end
end
