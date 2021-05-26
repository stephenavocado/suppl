# == Schema Information
#
# Table name: invitations
#
#  id           :integer          not null, primary key
#  status       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  project_id   :integer
#  recipient_id :integer
#  sender_id    :integer
#
class Invitation < ApplicationRecord
  belongs_to(:sender, { :required => false, :class_name => "User", :foreign_key => "sender_id", :counter_cache => :invitations_sent_count })
  belongs_to(:recipient, { :required => false, :class_name => "User", :foreign_key => "recipient_id", :counter_cache => :invitation_requests_count })
  belongs_to(:project, { :required => false, :class_name => "Project", :foreign_key => "project_id", :counter_cache => true })
end
