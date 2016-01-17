# == Schema Information
#
# Table name: comments
#
#  id             :integer          not null, primary key
#  content        :string
#  commenter_id   :integer
#  commenter_type :string
#  is_blocked     :boolean          default(FALSE)
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Comment < ActiveRecord::Base
  belongs_to :commenter , :polymorphic => true

  validates :content, presence: true

  scope :unblocked, ->{ where(is_blocked: false) }
end
