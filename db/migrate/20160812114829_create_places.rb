class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :name
      t.string :address
      t.string :astablished_at
      t.string :phone_number
      t.string :contact_mail
      t.string :city
      t.string :description

      t.timestamps
    end
  end
end
