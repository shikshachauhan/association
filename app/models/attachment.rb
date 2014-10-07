class Attachment < ActiveRecord::Base
  belongs_to :email
  scope :vedios, -> { where(type: 'Vedio') }
  scope :audios, -> { where(type: 'Audio') }
  scope :texts, -> { where(type: 'Text') }
  scope :zips, -> { where(type: 'Zip') }

  after_save :set_email_as_spam, if: -> { type == 'Text' }

  protected

  def set_email_as_spam
    self.email.update(spam: true)
  end
end
