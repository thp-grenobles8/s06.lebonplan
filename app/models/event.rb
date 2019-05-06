class Event < ApplicationRecord

  belongs_to :administrator, class_name: 'User'
  has_many :attendances
  has_many :attendees, through: :attendances

  # validations -------------------------------
  validates :start_date,
    presence: true

  validate :no_past_start_date
  def no_past_start_date
    if self.start_date < Time.now
      errors.add("on ne peut pas créer un évènement dans le turfu!")
    end
  end

  validates :duration,
    presence: true

  validate :duration_modulo_5
  def duration_modulo_5
    if !(self.duration % 5 == 0 && self.duration >= 5)
      errors.add("doit être un multiple de 5")
    end
  end

  validates :title,
    presence: true,
    length: { in: 5..140 }

  validates :description,
    presence: true,
    length: { in: 20..1000 }

  validates :price,
    presence: true,
    numericality: {
      greater_than: 1,
      less_than: 1000
    }

  validates :location,
    presence: true
end
