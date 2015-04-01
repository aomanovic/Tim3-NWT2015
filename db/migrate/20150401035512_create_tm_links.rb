class CreateTmLinks < ActiveRecord::Migration
  def change
    create_table :tm_links do |t|
      t.integer :TherapyID
      t.integer :MedicamentID
      t.string :Quantity
      t.string :Description

      t.timestamps
    end
  end
end
