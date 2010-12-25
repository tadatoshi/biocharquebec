
# Example:
#   BlogPost.should search_by(:title, :content)
def search_by(*fields)
  SearchMatcher.new(*fields)
end

class SearchMatcher
  include MongoidModelHelpers

  KEYWORD = "temp"
  FIELD_CONTENT_WITH_KEYWORD = "This contains the keyword #{KEYWORD} and something else."
  FIELD_CONTENT_WITHOUT_KEYWORD = "Used for some data."
  
  def initialize(*fields)
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
        @matching_models << create_model(@fields[index])
      end
      @all_models = @matching_models + [create_model]
    end

    def create_model(field_with_keyword = nil)
      model = @model_class.new do |model_object|
        @fields.each do |field| 
          field_writer_symbol = "#{field}=".to_sym
          if field == field_with_keyword
            model_object.send(field_writer_symbol, FIELD_CONTENT_WITH_KEYWORD)
          else
            model_object.send(field_writer_symbol, FIELD_CONTENT_WITHOUT_KEYWORD)
          end
        end
      end
      model.save!
      model
    end

end