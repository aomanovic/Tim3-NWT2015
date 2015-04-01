class CreateDtLinks < ActiveRecord::Migration
  def change
    create_table :dt_links do |t|
      t.integer :DiagnoseID
      t.integer :TherapyID
      t.string :Description

      t.timestamps
    end
  end
end
