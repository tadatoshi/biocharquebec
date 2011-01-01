Before do
  Admin.delete_all
  BlogPost.delete_all
  Event.delete_all
  Video.delete_all
  ReferenceFile.delete_all
  DatabaseCleaner.start
end

After do
  DatabaseCleaner.clean
  Admin.delete_all
  BlogPost.delete_all
  Event.delete_all
  Video.delete_all
  ReferenceFile.delete_all
end