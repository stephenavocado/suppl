# == Schema Information
#
# Table name: elements
#
#  id          :integer          not null, primary key
#  name        :string
#  saves_count :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  material_id :integer
#  room_id     :integer
#
class Element < ApplicationRecord
  belongs_to(:room, { :required => false, :class_name => "Room", :foreign_key => "room_id"})
  # has_many(:saves, { :class_name => "Safe", :foreign_key => "element_id", :dependent => :destroy })
  belongs_to(:material, { :required => false, :class_name => "Material", :foreign_key => "material_id"})
end
