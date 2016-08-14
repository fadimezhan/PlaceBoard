class Category < ApplicationRecord

  def places
    Place.where(category_id: id)
  end
end