class CreateTaskMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :task_members do |t|
      t.integer :user_id, :null => false, :references => [:users, :id]
      t.integer :task_id, :null => false, :references => [:tasks, :id]
      t.timestamps
    end
  end
end
