# == Schema Information
#
# Table name: courses
#
#  id             :integer          not null, primary key
#  name           :string
#  video_url      :string
#  level          :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  audio_id       :integer
#  cover_image_id :integer
#

require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
