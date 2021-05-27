# == Schema Information
#
# Table name: palette_saves
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  material_id :integer
#  palette_id  :integer
#
class PaletteSafe < ApplicationRecord
  belongs_to(:palette, { :required => false, :class_name => "Palette", :foreign_key => "palette_id", :counter_cache => false })
  belongs_to(:material, { :required => false, :class_name => "Material", :foreign_key => "material_id", :counter_cache => false })
end
