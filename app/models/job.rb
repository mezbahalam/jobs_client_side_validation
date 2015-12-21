class Job < ActiveRecord::Base
  require 'carrierwave/orm/activerecord'
  mount_uploader :job_image, JobImageUploader
  validates :title, presence: true
  validates :description, length: {minimum: 50, maximum: 350}, allow_blank: false
  validates :job_image, presence: true
  belongs_to :user
end