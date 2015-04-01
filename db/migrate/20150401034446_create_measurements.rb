class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.integer :PersonID
      t.string :VP1
      t.string :VP2
      t.string :VP3
      t.datetime :Date

      t.timestamps
    end
  end
end
