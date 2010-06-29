module SearchContentsHelper
  
  def title_path(result)
    self.send("#{result.class.name.pluralize.underscore}_path".to_sym, "#{result.class.name.underscore}_id".to_sym => result.id)
  end
  
end
