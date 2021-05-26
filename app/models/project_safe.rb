# == Schema Information
#
# Table name: project_saves
#
#  id                      :integer          not null, primary key
#  approval_requests_count :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  element_id              :integer
#  material_id             :integer
#
class ProjectSafe < ApplicationRecord
  belongs_to(:element, { :required => false, :class_name => "Element", :foreign_key => "element_id", :counter_cache => true })
  belongs_to(:material, { :required => false, :class_name => "Material", :foreign_key => "material_id", :counter_cache => true })
  has_many(:approval_requests, { :class_name => "ApprovalRequest", :foreign_key => "project_save_id", :dependent => :destroy })
end
