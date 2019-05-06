class User < ApplicationRecord
  after_create :welcome_send

  has_many :admin_events, class_name: 'Event', foreign_key: 'administrator_id'

  has_many :attendances, foreign_key: 'attendee_id'
  has_many :attended_events, through: :attendances, source: :event


  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

end
