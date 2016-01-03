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
#  cover_image_id    :integer
#  image_ids    :integer
#

class Column < ActiveRecord::Base
  has_many :column_tags
  has_many :tags, through: :column_tags
  
  validates :name, :video_url, presence: true
  enum category: [:teacher, :student, :master]

  def cover_image
    if self.cover_image_id
      Attachment.find(self.cover_image_id)
    end
  end

  def images
    if self.image_ids
      self.image_ids.map do |id|
        Attachment.find(id)
      end
    end
  end

  def is_images_exist(ids)
    if Attachment.find(ids)
      return true
    end
    false
  end

  def get_cover_image_url
    if self.cover_image_id
      cover_image = Attachment.find(self.cover_image_id)
      url = cover_image.file.url
    else
      url = "images/search/01.jpg"
    end
  end

end
