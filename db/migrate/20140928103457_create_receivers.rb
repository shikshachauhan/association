class CreateReceivers < ActiveRecord::Migration
  def change
    create_table :receivers do |t|
      t.references :email, index: true
      t.references :mailbox, index: true

      t.timestamps
    end
  end
end
