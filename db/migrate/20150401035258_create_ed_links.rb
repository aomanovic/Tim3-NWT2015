class CreateEdLinks < ActiveRecord::Migration
  def change
    create_table :ed_links do |t|
      t.integer :EvidentionID
      t.integer :DiagnoseID
      t.string :Description

      t.timestamps
    end
  end
end
