# == Schema Information
#
# Table name: column_tags
#
#  id             :integer          not null, primary key
#  tag_id        :integer
#  column_id      :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class ColumnTag < ActiveRecord::Base
  belongs_to :tag
  belongs_to :column
end
