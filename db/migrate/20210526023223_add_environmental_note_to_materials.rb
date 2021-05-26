class AddEnvironmentalNoteToMaterials < ActiveRecord::Migration[6.0]
  def change
    add_column :materials, :environmental_note, :string
  end
end
