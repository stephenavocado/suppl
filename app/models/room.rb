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
  belongs_to(:project, { :required => false, :class_name => "Project", :foreign_key => "project_id" })
  # , :counter_cache => :spaces_count
  # has_many(:elements, { :class_name => "Element", :foreign_key => "room_id", :dependent => :destroy })
end
