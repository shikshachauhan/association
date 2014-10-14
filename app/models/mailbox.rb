class Mailbox < ActiveRecord::Base
  has_many :sent_emails, class_name: Email
  has_many :contacts
  has_many :friends, source: :contact_mailbox, through: :contacts

  has_many :mails_sent_to_me, class_name: Receiver
  has_many :received_emails, source: :email, through: :mails_sent_to_me
  has_many :received_email_mailboxes, source: :sending_mailbox, through: :received_emails

  before_destroy :check_if_spam_mailbox

  protected


  def check_if_spam_mailbox
    # FIXME_AK: We can reduce the query count and no need for self.
    sent_emails.all?{ |email| email.spam } && received_emails.all?{ |email| email.spam }
  end

end
