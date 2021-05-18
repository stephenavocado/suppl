class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :project_name
      t.integer :user_id
      t.string :description
      t.string :photo
      t.integer :spaces_count
      t.integer :invitations_count

      t.timestamps
    end
  end
end
