class Mailbox < ActiveRecord::Base
  has_many :sent_emails, class_name: 'Email'
  # FIXME_AK: Do we want to preserve the contacts when the mailbox is destroyed?
  has_many :contacts
  has_many :friends, source: :contact_mailbox, through: :contacts
  # FIXME_AK: I didn't understand this association.
  has_many :mails_sent_to_me, class_name: 'Receiver'
  has_many :received_emails, source: :email, through: :mails_sent_to_me
  has_many :received_email_mailboxes, source: :sending_mailbox, through: :received_emails

  before_destroy :check_if_spam_mailbox

  # scope :spams, -> { sent_emails.where(spam: true) }

  protected

  def check_if_spam_mailbox
    # FIXME_AK: We can reduce the query count and no need for self.
    self.sent_emails.all?{ |email| email.spam } && self.received_emails.all?{ |email| email.spam }
  end
end
