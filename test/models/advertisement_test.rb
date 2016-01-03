# == Schema Information
#
# Table name: advertisements
#
#  id             :integer          not null, primary key
#  name           :string
#  purchase_url   :string
#  cover_image_id :integer
#  status         :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class AdvertisementTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
