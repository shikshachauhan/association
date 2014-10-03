class AddSti < ActiveRecord::Migration
  def change
    change_table :attachments do |t|
      t.rename(:file_type, :type)
    end
  end
end
