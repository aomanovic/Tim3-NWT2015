class CreateMasterMedicalFacilities < ActiveRecord::Migration
  def change
    create_table :master_medical_facilities do |t|
      t.string :Code
      t.string :Name
      t.string :Address
      t.string :Telephone

      t.timestamps
    end
  end
end
