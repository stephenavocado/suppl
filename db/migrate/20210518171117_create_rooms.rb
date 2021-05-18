class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.integer :project_id
      t.string :description
      t.integer :elements_count

      t.timestamps
    end
  end
end
