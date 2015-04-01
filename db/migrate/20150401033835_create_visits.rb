class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :PersonID
      t.datetime :Date
      t.integer :MedicalStuffID

      t.timestamps
    end
  end
end
