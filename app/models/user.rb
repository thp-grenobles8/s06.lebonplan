class User < ApplicationRecord

  has_many :admin_events, foreign_key: 'administrator_id'

  has_many :attendances, foreign_key: 'attendee_id'
  has_many :attended_events, through: :attendances, source: :events
end
