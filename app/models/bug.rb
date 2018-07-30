class Bug < ApplicationRecord
  belongs_to :creator, class_name: :User
  belongs_to :developer, class_name: :User,optional: true
  belongs_to :project
  validates :title, uniqueness: true
  mount_uploader :screenshot, ScreenshotUploader


    TYPE=['feature','bug']
	STATUS=['new','started','completed']
end
