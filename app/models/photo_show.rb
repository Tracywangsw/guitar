# == Schema Information
#
# Table name: photot_shows
#
#  id             :integer          not null, primary key
#  description        :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  image_id     :integer
#

class PhotoShow < ActiveRecord::Base
  def image
    if self.image_id
      Attachment.find(self.image_id)
    end
  end

end
