class SearchContent
  
  attr_accessor :keyword
  attr_reader :model
  
  def initialize(model, options = {})
    @model = model
    @method_name_conversion = options[:method_name_conversion] || {}
  end
  
  def model_class
    @model.class
  end

  def method_missing(method_name_symbol, *args, &block)
    begin
      converted_method_name_symbol = @method_name_conversion[method_name_symbol] || method_name_symbol
      result = @model.respond_to?(converted_method_name_symbol) ? @model.send(converted_method_name_symbol, *args, &block) : nil
    rescue
      result = super.method_missing(method_name_symbol, *args, &block)
    end
    result
  end  
  
  class << self
    
    def search(keyword)
      
      results = []
      
      results += Overview.search(keyword).map do |overview|
        SearchContent.new(overview, :method_name_conversion => { :content => :description })
      end
      
      results += BlogPost.search(keyword).map do |blog_post|
        SearchContent.new(blog_post)
      end
      
      results += Event.search(keyword).map do |event|
        SearchContent.new(event, :method_name_conversion => { :content => :description })
      end
      
      results += ReferenceFile.search(keyword).map do |reference_file|
        SearchContent.new(reference_file)
      end
      
      results += Video.search(keyword).map do |video|
        SearchContent.new(video)
      end            
      
      results
      
    end
    
  end
  
end
