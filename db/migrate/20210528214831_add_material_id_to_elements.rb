class AddMaterialIdToElements < ActiveRecord::Migration[6.0]
  def change
    add_column :elements, :material_id, :integer
  end
end
