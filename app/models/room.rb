# == Schema Information
#
# Table name: rooms
#
#  id             :integer          not null, primary key
#  description    :string
#  elements_count :integer
#  name           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  project_id     :integer
#
class Room < ApplicationRecord
end
