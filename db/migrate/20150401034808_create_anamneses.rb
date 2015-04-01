class CreateAnamneses < ActiveRecord::Migration
  def change
    create_table :anamneses do |t|
      t.integer :PersonID
      t.integer :MedicalFacilityID
      t.datetime :DateOfCreation
      t.integer :UserID
      t.string :Remark

      t.timestamps
    end
  end
end
