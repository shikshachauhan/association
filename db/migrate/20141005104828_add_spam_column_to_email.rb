class AddSpamColumnToEmail < ActiveRecord::Migration
  def change
    add_column :emails, :spam, :boolean, default: false
  end
end
