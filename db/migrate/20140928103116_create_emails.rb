class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :content
      t.references :mailbox, index: true
      t.references :email, index: true

      t.timestamps
    end
  end
end
