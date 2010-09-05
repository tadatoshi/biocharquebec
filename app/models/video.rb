class Video
  include Mongoid::Document

  field :thumbnail_file_path
  field :video_file_path
  field :title

  index :title
end
