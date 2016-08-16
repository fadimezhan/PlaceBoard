class Place < ApplicationRecord
 has_many :comments
 belongs_to :owner
  def category
    Category.find(category_id)
  end
end
