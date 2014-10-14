class RemoveColumnFromLog < ActiveRecord::Migration
  def change
    remove_column :logs, :logged_email_id
  end
end
