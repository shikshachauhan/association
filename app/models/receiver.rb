class Receiver < ActiveRecord::Base
  belongs_to :email, counter_cache: true
  belongs_to :mailbox

  before_create :check_receiver_upper_limit
  after_save :save_contact_in_receiver

  protected
  def check_receiver_upper_limit
    self.email.reload
    self.email.receivers_count < 20
  end

  def save_contact_in_receiver
    contact_mailbox = self.email.sending_mailbox
    params_hash = { first_name: contact_mailbox.name, contact_mailbox_id: contact_mailbox.id }
    self.mailbox.contacts.create(params_hash)
  end
end
