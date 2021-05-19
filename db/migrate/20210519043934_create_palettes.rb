class CreatePalettes < ActiveRecord::Migration[6.0]
  def change
    create_table :palettes do |t|
      t.integer :material_id
      t.integer :user_id
      t.integer :name
      t.string :description
      t.integer :saves_count

      t.timestamps
    end
  end
end
