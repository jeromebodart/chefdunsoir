class ReorderColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :reviewable_type
    remove_column :reviews, :reviewable_id
    remove_column :reviews, :chef, :boolean
    remove_column :reviews, :sender_id
    remove_column :reviews, :receiver_id
    change_table :reviews do |t|
    t.references :writter, foreign_key: {to_table: :users}
    t.references :restaurant, foreign_key: {to_table: :restaurants}
    end

    change_table :reservations do |t|
      t.references :chef, foreign_key: {to_table: :users}
      t.remove :user_id
    end
  end
end
