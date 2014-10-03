class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :ph_no
      t.references :mailbox, index: true

      t.timestamps
    end
  end
end
