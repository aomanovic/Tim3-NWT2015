class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :Name
      t.string :Surname
      t.datetime :DateOfBirth
      t.integer :UserTypeID
      t.string :Address
      t.string :Telephone

      t.timestamps
    end
  end
end
