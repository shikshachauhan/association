class Contact < ActiveRecord::Base
  belongs_to :mailbox
  belongs_to :contact_mailbox, class_name: 'Mailbox', foreign_key: 'contact_mailbox_id'

  before_create :set_first_name_if_not_given
  after_save :generate_reverse_mapping

  validates :contact_mailbox_id, uniqueness: { scope: :mailbox_id }


  protected

  def set_first_name_if_not_given
    self.first_name ||= contact_mailbox.name
  end

  def generate_reverse_mapping
    Contact.create(mailbox_id: contact_mailbox_id, contact_mailbox_id: mailbox_id)
  end
end
