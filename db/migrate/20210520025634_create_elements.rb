class CreateElements < ActiveRecord::Migration[6.0]
  def change
    create_table :elements do |t|
      t.integer :room_id
      t.string :name
      t.integer :saves_count

      t.timestamps
    end
  end
end
