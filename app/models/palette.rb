# == Schema Information
#
# Table name: palettes
#
#  id          :integer          not null, primary key
#  description :string
#  name        :integer
#  saves_count :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  material_id :integer
#  user_id     :integer
#
class Palette < ApplicationRecord
end
