require 'carrierwave/orm/mongoid'

class ReferenceFile
  include Mongoid::Document

  field :title

  index :title

  mount_uploader :file, FileUploader
end
