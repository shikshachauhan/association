class AddCoulumnToMailbox < ActiveRecord::Migration
  def change
    add_column :mailboxes, :sent_emails_count, :integer, default: 0
  end
end
