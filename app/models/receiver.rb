class Receiver < ActiveRecord::Base
  # FIXME_AK: What purpose does counter_cache is serving here?
  belongs_to :email, counter_cache: true
  belongs_to :mailbox

  # FIXME_AK: Can you explain the following checks.
  before_save :receiver_overflow, if: -> { email_id? }
  after_save :save_contact_in_receiver, if: -> { mailbox_id? }

  validates_associated :email

  protected

  def receiver_overflow
    email.receivers.count < 20
  end

  def save_contact_in_receiver
    contact_mailbox = self.email.sending_mailbox
    params_hash = { first_name: contact_mailbox.name, contact_mailbox_id: contact_mailbox.id }
    self.mailbox.contacts.create(params_hash)
  end
end
