# == Schema Information
#
# Table name: comments
#
#  id             :integer          not null, primary key
#  content        :string
#  commenter_id   :integer
#  commenter_type :string
#  is_blocked     :boolean          default(FALSE)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
