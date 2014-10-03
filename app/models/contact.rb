class Contact < ActiveRecord::Base
  belongs_to :mailbox
  belongs_to :friends, class_name: 'Mailbox', foreign_key: 'contact_mailbox_id'
end
