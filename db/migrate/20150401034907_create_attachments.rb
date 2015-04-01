class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.integer :EvidentionID
      t.string :Image

      t.timestamps
    end
  end
end
