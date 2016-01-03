# == Schema Information
#
# Table name: columns
#
#  id          :integer          not null, primary key
#  name        :string
#  video_url   :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category    :integer
#

require 'test_helper'

class ColumnTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
