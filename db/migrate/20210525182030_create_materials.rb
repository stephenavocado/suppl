class CreateMaterials < ActiveRecord::Migration[6.0]
  def change
    create_table :materials do |t|
      t.string :photo_ref
      t.integer :manufacturer_id
      t.string :name
      t.string :residential_use
      t.string :commercial_use
      t.string :materials
      t.string :price_range
      t.string :description
      t.string :indoor_outdoor
      t.string :application
      t.string :manufacturer_note
      t.string :flammability
      t.string :hardness
      t.string :availability
      t.string :lead_time
      t.string :min_units
      t.string :country_of_origin
      t.string :content
      t.string :finish
      t.string :construction
      t.string :wood_grade
      t.string :wood_figuring
      t.integer :saves_count

      t.timestamps
    end
  end
end
