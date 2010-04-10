class BlogEntry
  include MongoMapper::Document
  
  key :title, String, :required => true
  key :content, String
end
