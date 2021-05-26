class AddTypeToMaterials < ActiveRecord::Migration[6.0]
  def change
    add_column :materials, :type, :string
  end
end
