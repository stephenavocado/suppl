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
end
