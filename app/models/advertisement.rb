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

class Advertisement < ActiveRecord::Base
  enum status: ["on", "off"]

  def cover_image
    if self.cover_image_id
      Attachment.find(self.cover_image_id)
    end
  end
end
