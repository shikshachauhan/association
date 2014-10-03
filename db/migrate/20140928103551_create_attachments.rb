class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :file_name
      t.string :file_type
      t.references :email, index: true

      t.timestamps
    end
  end
end
