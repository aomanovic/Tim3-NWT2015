class AddUserDiagnoses < ActiveRecord::Migration
  def change

    create_table :user_diagnoses do |t|
      t.references :user
      t.references :diagnosis

      t.timestamps
    end
  end
end
