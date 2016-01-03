# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string
#  password_digest :string
#  email           :string
#  is_admin        :boolean          default(FALSE)
#  is_frozen       :boolean          default(FALSE)
#  admin_type      :integer
#  course_collects :integer          default([]), is an Array
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  score_collects  :integer          default([]), is an Array
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
