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
end
