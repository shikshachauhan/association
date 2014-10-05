class Contact < ActiveRecord::Base
  belongs_to :mailbox
  belongs_to :contact_mailbox, class_name: 'Mailbox', foreign_key: 'contact_mailbox_id'
end
