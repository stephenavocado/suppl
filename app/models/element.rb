# == Schema Information
#
# Table name: elements
#
#  id          :integer          not null, primary key
#  name        :string
#  saves_count :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  room_id     :integer
#
class Element < ApplicationRecord
end
