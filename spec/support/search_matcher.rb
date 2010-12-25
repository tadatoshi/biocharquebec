
# Example:
#   BlogPost.should search_by(:title, :content, :locale => I18n.locale.to_s)
def search_by(*fields)
  SearchMatcher.new(*fields)
end

class SearchMatcher
  include MongoidModelHelpers

  KEYWORD = "temp"
  FIELD_CONTENT_WITH_KEYWORD = "This contains the keyword #{KEYWORD} and something else."
  FIELD_CONTENT_WITHOUT_KEYWORD = "Used for some data."
  LOCALES = ["en", "fr"]

  def initialize(*fields)
    if fields.try(:last).instance_of?(Hash)
      @locale = fields.pop[:locale]
    end    
    @fields = fields
  end

  def matches?(model_class)
    @model_class = model_class
    @model_class.delete_all
    create_models
    @search_result = model_class.search(KEYWORD)
    execute_query_to_models(@search_result) == @matching_models
  end

  def failure_message_for_should
    "expected #{@model_class} to find #{@matching_models} but got #{execute_query_to_models(@search_result)}"
  end

  private
    def create_models
      @all_models = []
      @matching_models = []

      (0..@fields.size-1).each do |index|
        if @locale
          model_with_matching_locale = create_model(@fields[index], @locale)
          @matching_models << model_with_matching_locale
          @all_models << model_with_matching_locale
          
          model_with_other_locale = create_model(@fields[index], other_locale)
          @all_models << model_with_other_locale
        else
          model = create_model(@fields[index])
          @matching_models << model
          @all_models << model
        end
      end
      
      if @locale
        LOCALES.each { |locale| @all_models << create_model(nil, locale) }
      else
        @all_models << create_model(nil)
      end
    end

    def create_model(field_with_keyword, locale = nil)
      model = @model_class.new do |model_object|
        @fields.each do |field| 
          field_writer_symbol = "#{field}=".to_sym
          if field == field_with_keyword
            model_object.send(field_writer_symbol, FIELD_CONTENT_WITH_KEYWORD)
          else
            model_object.send(field_writer_symbol, FIELD_CONTENT_WITHOUT_KEYWORD)
          end
          model_object.locale = locale if locale
        end
      end
      model.save!
      model
    end
    
    def other_locale
      locales_copy = Array.new(LOCALES)
      locales_copy.delete(@locale)
      locales_copy.first
    end

end