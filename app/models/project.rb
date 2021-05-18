# == Schema Information
#
# Table name: projects
#
#  id                :integer          not null, primary key
#  description       :string
#  invitations_count :integer
#  photo             :string
#  project_name      :string
#  spaces_count      :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :integer
#
class Project < ApplicationRecord
  belongs_to(:user, { :required => false, :class_name => "User", :foreign_key => "user_id", :counter_cache => true })
  has_many(:spaces, { :class_name => "Room", :foreign_key => "project_id", :dependent => :destroy })
end
