# == Schema Information
#
# Table name: manufacturers
#
#  id              :integer          not null, primary key
#  description     :string
#  materials_count :integer
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Manufacturer < ApplicationRecord
  has_many(:materials, { :class_name => "Material", :foreign_key => "manufacturer_id", :dependent => :destroy })
end
