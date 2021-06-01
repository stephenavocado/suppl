# == Schema Information
#
# Table name: approvals
#
#  id           :integer          not null, primary key
#  note         :string
#  status       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  approver_id  :integer
#  requester_id :integer
#  space_id     :integer
#
class Approval < ApplicationRecord
  belongs_to(:requester, { :required => false, :class_name => "User", :foreign_key => "requester_id", :counter_cache => :approval_requests_count })
  belongs_to(:approver, { :required => false, :class_name => "User", :foreign_key => "approver_id", :counter_cache => true })
  belongs_to(:space, { :required => false, :class_name => "Room", :foreign_key => "space_id", :counter_cache => true })
end
