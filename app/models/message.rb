# == Schema Information
#
# Table name: messages
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  content       :string
#  has_been_read :boolean          default(FALSE)
#  type          :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Message < ActiveRecord::Base
  belongs_to :user
  def Message.msg_count(user_id)
    count = Message.where(user_id: user_id, has_been_read: false).to_a.count
  end
end
