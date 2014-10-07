class AddColumnToEmail < ActiveRecord::Migration
  def change
    add_column :emails, :receivers_count, :integer
  end
end
