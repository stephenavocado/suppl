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
  validates :username,  :presence => true, :uniqueness => { :case_sensitive => false }

  has_secure_password

  has_many(:invitations_sent, { :class_name => "Invitation", :foreign_key => "sender_id", :dependent => :destroy })
  has_many(:invitation_requests, { :class_name => "Invitation", :foreign_key => "recipient_id", :dependent => :destroy })
  has_many(:pallets, { :class_name => "Palette", :foreign_key => "user_id", :dependent => :destroy })
  has_many(:projects, { :class_name => "Project", :foreign_key => "user_id", :dependent => :destroy })
end
