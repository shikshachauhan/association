class Email < ActiveRecord::Base
  belongs_to :mailbox
  belongs_to :email
  has_many :emails
  has_many :receivers
  has_many :mailboxes, through: :receivers
  has_many :attachments
end
