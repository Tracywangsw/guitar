# == Schema Information
#
# Table name: tags
#
#  id             :integer          not null, primary key
#  name        :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  cover_image_id     :integer
#

class Tag < ActiveRecord::Base
  has_many :column_tags
  has_many :columns, through: :column_tags
  has_many :course_tags
  has_many :courses, through: :course_tags

  validates :name, presence: true, uniqueness: true

  def Tag.get_all_tags(tag_list)
    if tag_list
      name_list = ""
      tag_list.each do |t|
        name_list = name_list + t.name + " "
      end
      name_list
    end
  end

  def cover_image
    if self.cover_image_id
      Attachment.find(self.cover_image_id)
    end
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
