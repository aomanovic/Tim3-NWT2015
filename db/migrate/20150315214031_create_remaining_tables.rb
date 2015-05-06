class CreateRemainingTables < ActiveRecord::Migration
  def up
    create_table :symptoms do |t|
    	t.string :name
    	t.string :code
    	t.text   :description

    	t.timestamps
    end

    create_table :user_symptoms do |t|
    	t.references :user
    	t.references :symptom

    	t.timestamps
    end

  end

  def down
  	drop_table :symptoms
  	drop_table :user_symptoms
  end
end