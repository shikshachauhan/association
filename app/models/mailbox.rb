class Mailbox < ActiveRecord::Base
  has_many :sent_emails, class_name: 'Email'
  has_many :contacts
  has_many :friends, source: :contact_mailbox, through: :contacts
  has_many :mails_sent_to_me, class_name: 'Receiver'
  has_many :received_emails, source: :email, through: :mails_sent_to_me
  has_many :received_email_mailboxes, source: :sending_mailbox, through: :received_emails
end
