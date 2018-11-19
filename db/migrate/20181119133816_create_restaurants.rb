class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.integer :capicity
      t.string :category
      t.string :address
      t.float :longitude
      t.float :latitude
      t.integer :priceperday
      t.string :photos
      t.boolean :monday
      t.boolean :tuesday
      t.boolean :wednesday
      t.boolean :thursday
      t.boolean :friday
      t.boolean :saturday
      t.boolean :sunday
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
