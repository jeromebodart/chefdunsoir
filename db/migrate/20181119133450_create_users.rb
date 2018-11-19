class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.text :description
      t.string :photo
      t.string :password
      t.integer :phonenumber
      t.string :email

      t.timestamps
    end
  end
end
