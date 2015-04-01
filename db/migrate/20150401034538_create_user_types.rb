class CreateUserTypes < ActiveRecord::Migration
  def change
    create_table :user_types do |t|
      t.string :Code
      t.string :Name
      t.string :Description

      t.timestamps
    end
  end
end
