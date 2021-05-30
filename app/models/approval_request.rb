# == Schema Information
#
# Table name: approval_requests
#
#  id              :integer          not null, primary key
#  status          :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  element_id      :integer
#  project_save_id :integer
#  recipient_id    :integer
#  sender_id       :integer
#
class ApprovalRequest < ApplicationRecord
  belongs_to(:approval_seeker, { :required => false, :class_name => "User", :foreign_key => "sender_id", :counter_cache => true })
  belongs_to(:element, { :required => false, :class_name => "Element", :foreign_key => "element_id", :counter_cache => true })
end
