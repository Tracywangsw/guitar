# == Schema Information
#
# Table name: scores
#
#  id          :integer          not null, primary key
#  name        :string
#  image_ids   :integer          default([]), is an Array
#  description :string
#  course_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Score < ActiveRecord::Base
  belongs_to :course
  validates :name, presence: true

  def images
    self.image_ids.map do |id|
      Attachment.find(id)
    end
  end

  def is_images_valid(ids)
    ids = ids.map {|i| i.to_i}
    if ids.sort == self.image_ids.sort
      return true
    end
    false
  end

end

