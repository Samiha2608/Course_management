class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :type
      t.string :name
      t.string :email
      t.integer :phone_no
      t.text :address

      t.timestamps
    end
  end
end
