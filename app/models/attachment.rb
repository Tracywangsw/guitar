# == Schema Information
#
# Table name: attachments
#
#  id          :integer          not null, primary key
#  file        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Attachment < ActiveRecord::Base
  mount_uploader :file, AttachmentUploader
end
