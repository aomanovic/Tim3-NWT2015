class CreateMedicaments < ActiveRecord::Migration
  def change
    create_table :medicaments do |t|
      t.string :code
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
