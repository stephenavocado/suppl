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
end
