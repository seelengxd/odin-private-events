class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :attendances
  has_many :attendees, through: :attendances, source: :attendee, foreign_key: :user_id, class_name: 'User'

  scope :past, -> { where('date < ?', Date.today) }
  scope :present, -> { where('date >= ?', Date.today) }
end
