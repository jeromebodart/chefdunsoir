class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :description
      t.integer :stars
      t.boolean :chef
      t.references :sender, foreign_key: {to_table: :users}
      t.references :receiver, foreign_key: {to_table: :users}
      t.string :reviewable_id
      t.string :reviewable_type
      t.timestamps
    end

    add_index :reviews, [:reviewable_id, :reviewable_type]
  end
end
