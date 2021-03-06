class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :username
      t.string :password_digest
      t.string :session_key
      t.boolean  :is_active, default: true, null: false

      t.integer :user_type_id

      t.timestamps
    end
  end
end
