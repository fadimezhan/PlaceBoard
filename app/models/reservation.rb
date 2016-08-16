class Reservation < ApplicationRecord
  belongs_to :place
  belongs_to :customer

  validates :date, presence: true
  validates :number_of_people, presence: true
end
