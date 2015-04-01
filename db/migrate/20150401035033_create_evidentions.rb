class CreateEvidentions < ActiveRecord::Migration
  def change
    create_table :evidentions do |t|
      t.integer :AnamnesisID
      t.integer :PersonID
      t.integer :MedicalStuffID
      t.datetime :Date
      t.string :Remark

      t.timestamps
    end
  end
end
