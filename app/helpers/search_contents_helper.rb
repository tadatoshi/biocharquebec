module SearchContentsHelper
  
  def title_path(model)
    if model.instance_of?(BlogPost) || model.instance_of?(Video)
      self.send("#{model.class.name.pluralize.underscore}_path".to_sym, :id => model.id)
    else
      # Note: All the following three statements work the same way:
      # eval("#{model.class.name.underscore}_path(#{model.id})")
      # instance_eval("#{model.class.name.underscore}_path(#{model.id})")
      self.send("#{model.class.name.underscore}_path".to_sym, model.id)
    end
  end
  
end
