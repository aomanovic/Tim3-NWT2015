class CreateSymptoms < ActiveRecord::Migration
  def change
    create_table :symptoms do |t|
      t.string :code
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
