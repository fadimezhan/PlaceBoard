class Place < ApplicationRecord
 has_many :comments
  def category
    Category.find(category_id)
  end
end
