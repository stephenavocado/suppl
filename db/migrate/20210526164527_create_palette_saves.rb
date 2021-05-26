class CreatePaletteSaves < ActiveRecord::Migration[6.0]
  def change
    create_table :palette_saves do |t|
      t.integer :material_id
      t.integer :palette_id

      t.timestamps
    end
  end
end
