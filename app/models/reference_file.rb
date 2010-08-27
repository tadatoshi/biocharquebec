require 'carrierwave/orm/mongoid'

class ReferenceFile
  include Mongoid::Document
  mount_uploader :file, FileUploader
end
