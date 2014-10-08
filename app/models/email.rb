class Email < ActiveRecord::Base
  belongs_to :sending_mailbox, class_name: 'Mailbox', foreign_key: :mailbox_id, counter_cache: :sent_emails_count
  belongs_to :parent_email, class_name: 'Email', foreign_key: :email_id
  # FIXME_AK: No need for the single quotes for class.
  has_many :replies, class_name: 'Email'
  # FIXME_AK: Do we want to preserve the recievers when the email is destroyed?
  has_many :receivers
  has_many :receiving_mailboxes, source: :mailbox, through: :receivers
  # FIXME_AK: Ditto for attachments.
  has_many :attachments

  before_create :set_subject, unless: -> { subject.present? }
  before_create :check_mailbox_upperlimit
  

  protected
  def set_subject
    self.subject = 'No Subject'
  end

  def check_mailbox_upperlimit
    # FIXME_AK: Why do we need to reload?
    self.sending_mailbox.reload
    self.sending_mailbox.sent_emails_count < 10
  end

end
