class Email < ActiveRecord::Base
  belongs_to :sending_mailbox, class_name: 'Mailbox', foreign_key: :mailbox_id
  belongs_to :parent_email, class_name: 'Email', foreign_key: :email_id
  has_many :replies, class_name: 'Email'
  has_many :receivers
  has_many :receiving_mailboxes, source: :mailbox, through: :receivers
  has_many :attachments
end
