# == Schema Information
#
# Table name: palettes
#
#  id           :integer          not null, primary key
#  description  :string
#  name         :integer
#  palette_name :string
#  saves_count  :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  material_id  :integer
#  user_id      :integer
#
class Palette < ApplicationRecord
  belongs_to(:user, { :required => false, :class_name => "User", :foreign_key => "user_id" })
  # , :counter_cache => :pallets_count
  # has_many(:saves, { :class_name => "Safe", :foreign_key => "palette_id", :dependent => :nullify })
end
