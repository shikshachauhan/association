class Mailbox < ActiveRecord::Base
  has_many :emails
  has_many :contacts
  has_many :mailboxes, source: :friends, through: :contacts
end
