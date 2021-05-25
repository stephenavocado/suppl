class CreateManufacturers < ActiveRecord::Migration[6.0]
  def change
    create_table :manufacturers do |t|
      t.string :name
      t.string :description
      t.integer :materials_count

      t.timestamps
    end
  end
end
