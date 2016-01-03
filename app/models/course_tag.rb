# == Schema Information
#
# Table name: course_tags
#
#  id             :integer          not null, primary key
#  tag_id        :integer
#  course_id      :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class CourseTag < ActiveRecord::Base
  belongs_to :tag
  belongs_to :course
end
