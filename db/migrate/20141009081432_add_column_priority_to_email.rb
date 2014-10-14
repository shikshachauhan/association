class AddColumnPriorityToEmail < ActiveRecord::Migration
  def change
    add_column :emails, :priority, :integer
  end
end
