class CreateTherapies < ActiveRecord::Migration
  def change
    create_table :therapies do |t|
      t.string :code
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
