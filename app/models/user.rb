# == Schema Information
#
# Table name: users
#
#  id                        :integer          not null, primary key
#  comments_count            :integer
#  email                     :string
#  first_name                :string
#  invitation_requests_count :integer
#  invitations_sent_count    :integer
#  last_name                 :string
#  password_digest           :string
#  projects_count            :integer
#  user_type                 :string
#  username                  :string
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
end
