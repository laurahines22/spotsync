class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :nickname
      t.string :email
      t.string :profile_url
      t.string :profile_image
      t.string :token
      t.string :refresh_token
      t.integer :expires_at
      t.boolean :expires
      t.string :provider
      t.text :uid

      t.timestamps null: false
    end
  end
end
