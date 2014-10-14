class RangeValidator < ActiveModel::EachValidator
  CHECKS = { greater_than: :>,
             greater_than_or_equal_to: :>=,
             equal_to: :==, less_than: :<,
             less_than_or_equal_to: :<=,
             other_than: :!= }


  def validate_each(record, attr_name, value)
    options.each do |option, option_value|
      if option_value
        unless value.send(CHECKS[option], option_value)
          record.errors[attr_name] << (options[:message] || "has failed validation")
        end
      end
    end  
  end

end

class Email < ActiveRecord::Base


  belongs_to :sending_mailbox, class_name: Mailbox, foreign_key: :mailbox_id, counter_cache: :sent_emails_count
  belongs_to :parent_email, class_name: Email, foreign_key: :email_id

  has_many :replies, class_name: Email

  has_many :receivers, dependent: :destroy
  has_many :receiving_mailboxes, source: :mailbox, through: :receivers

  has_many :attachments, dependent: :destroy

  before_create :set_subject, unless: -> { subject? }
  after_create :enter_log_record
  before_save :check_mailbox_upperlimit, if: -> { mailbox_id? }

  validates :priority, range: { greater_than: nil, less_than: 5, other_than: 3 }, if: -> { priority? }  

  protected
  def set_subject
    self.subject = 'No Subject'
  end

  def enter_log_record
    Log.create(description:"An email with email id #{ id } has been sent from a mailbox with mailbox id #{ mailbox_id }")
  end

  def check_mailbox_upperlimit
    sending_mailbox.sent_emails.count < 10
  end

end
