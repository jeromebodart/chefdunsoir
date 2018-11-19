class CreateIndisponibilities < ActiveRecord::Migration[5.2]
  def change
    create_table :indisponibilities do |t|
      t.string :day
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
