class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :welcome_send
  before_validation :autonaming

  has_many :admin_events, class_name: 'Event', foreign_key: 'administrator_id'

  has_many :attendances, foreign_key: 'attendee_id'
  has_many :attended_events, through: :attendances, source: :event


  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def autonaming
    if !self.name || self.name == ""
      self.name = self.email.split('@')[0]
    end
  end

end
