class CreateEsLinks < ActiveRecord::Migration
  def change
    create_table :es_links do |t|
      t.integer :EvidentionID
      t.integer :SymptomID
      t.string :Description

      t.timestamps
    end
  end
end
