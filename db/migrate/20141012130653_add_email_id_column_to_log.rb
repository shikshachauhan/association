class AddEmailIdColumnToLog < ActiveRecord::Migration
  def change
    add_column :logs, :logged_email_id, :integer, index: true
  end
end
