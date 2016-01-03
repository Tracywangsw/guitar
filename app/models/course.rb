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
#  description :string
#

class Course < ActiveRecord::Base
  attr_accessor :score_id

  has_one :score
  has_many :comments, -> { order 'created_at desc' }, as: :commenter
  has_many :course_tags
  has_many :tags, through: :course_tags

  # enum level: [ :level_low, :level_medium, :level_high ]

  validates :video_url, :name, presence: true

  # def audio
  #   self.audio_id && Attachment.find(self.audio_id)
  # end

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
      url = "/assets/index/carousel1.jpg"
    end
  end

  # def level_str
  #   case self.level
  #   when "level_low"
  #     "初级"
  #   when "level_medium"
  #     "中级"
  #   when "level_high"
  #     "高级"
  #   end
  # end
end
