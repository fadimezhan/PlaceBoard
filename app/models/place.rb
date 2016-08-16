class Place < ApplicationRecord
 has_many :comments
 belongs_to :owner
 has_many :reservations
  def category
    Category.find(category_id)
  end
end
