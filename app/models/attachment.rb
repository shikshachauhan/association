class Attachment < ActiveRecord::Base
  belongs_to :email
  scope :vedios, -> { where(type: 'Vedio') }
  scope :audios, -> { where(type: 'Audio') }
  scope :texts, -> { where(type: 'Text') }
  scope :zips, -> { where(type: 'Zip') }
end
