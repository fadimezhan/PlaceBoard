class Reservation < ApplicationRecord
  belongs_to :place
  belongs_to :customer
end
