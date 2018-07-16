class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.date :due_date
      t.integer :team_id, :null => false, :references => [:teams, :id]
      t.string :logo
      t.timestamps
    end
  end
end
