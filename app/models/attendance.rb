class Attendance < ApplicationRecord
  after_create :attendance_send

  belongs_to :event
  belongs_to :attendee, class_name: 'User'

  def attendance_send
    UserMailer.attendance_email(self).deliver_now
  end
end
