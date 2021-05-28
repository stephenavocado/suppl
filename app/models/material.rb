# == Schema Information
#
# Table name: materials
#
#  id                 :integer          not null, primary key
#  application        :string
#  availability       :string
#  commercial_use     :string
#  construction       :string
#  content            :string
#  country_of_origin  :string
#  description        :string
#  environmental_note :string
#  finish             :string
#  flammability       :string
#  hardness           :string
#  indoor_outdoor     :string
#  lead_time          :string
#  manufacturer_note  :string
#  materials          :string
#  min_units          :string
#  name               :string
#  photo_ref          :string
#  price_range        :string
#  residential_use    :string
#  saves_count        :integer
#  type               :string
#  wood_figuring      :string
#  wood_grade         :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  manufacturer_id    :integer
#
class Material < ApplicationRecord
  belongs_to(:manufacturer, { :required => false, :class_name => "Manufacturer", :foreign_key => "manufacturer_id", :counter_cache => true })
  has_many(:palette_saves, { :class_name => "PaletteSafe", :foreign_key => "material_id", :dependent => :destroy })
  has_many(:elements, { :class_name => "Element", :foreign_key => "material_id", :dependent => :nullify })
end
