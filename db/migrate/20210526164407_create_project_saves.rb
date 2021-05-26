class CreateProjectSaves < ActiveRecord::Migration[6.0]
  def change
    create_table :project_saves do |t|
      t.integer :element_id
      t.integer :material_id
      t.integer :approval_requests_count

      t.timestamps
    end
  end
end
