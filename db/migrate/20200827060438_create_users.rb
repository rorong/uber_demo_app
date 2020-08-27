class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :device
      t.string :device_token
      t.string :latitude
      t.string :longitude
      t.string :address
      t.string :role
      t.string :password_digest
      t.string :password
      t.boolean :registred_driver, default: false
      t.string :temp_password
      t.timestamps
    end
  end
end
