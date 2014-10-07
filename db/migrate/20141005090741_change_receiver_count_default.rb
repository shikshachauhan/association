class ChangeReceiverCountDefault < ActiveRecord::Migration
  def change
    change_column_default :emails, :receivers_count, 0
  end
end
