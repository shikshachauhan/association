class AddColumnToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :contact_mailbox_id, :integer
  end
end
