class AddPaletteNameToPalettes < ActiveRecord::Migration[6.0]
  def change
    add_column :palettes, :palette_name, :string
  end
end
