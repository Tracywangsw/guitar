# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string
#  password_digest :string
#  email           :string
#  is_admin        :boolean          default(FALSE)
#  is_frozen       :boolean          default(FALSE)
#  admin_type      :integer
#  course_collects :integer          default([]), is an Array
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  score_collects  :integer          default([]), is an Array
#

class User < ActiveRecord::Base
  has_many :messages
  has_many :comments

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true
  has_secure_password

  #send email for user
  after_create :send_welcome_mail
  def send_welcome_mail
    UserMailer.welcome(id).deliver_later
  end

  def add_course(course_id)
    update_attribute :course_collects, self.course_collects + [ course_id ]
  end

  def remove_course(course_id)
    update_attribute :course_collects, self.course_collects - [ course_id ]
  end

  def add_score(score_id)
    update_attribute :score_collects, self.score_collects + [ score_id ]
  end

  def remove_score(score_id)
    update_attribute :score_collects, self.score_collects - [ score_id ]
  end

  def has_collected_course(course_id)
    self.course_collects.include? course_id
  end

  def has_collected_score(score_id)
    self.score_collects.include? score_id
  end
end
