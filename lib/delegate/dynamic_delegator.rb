class DynamicDelegator < BasicObject

  def initialize(target, options = {})
    @target = target
    @method_name_conversion = options[:method_name_conversion] || {}
  end

  def method_missing(method_name_symbol, *args, &block)
    unless method_name_symbol == :new || method_name_symbol == :initialize
      result = @target.send((@method_name_conversion[method_name_symbol] || method_name_symbol), *args, &block)
      @target = result if result.kind_of?(@target.class)
      result
    else
      super.method_missing(method_name_symbol, *args, &block)
    end
  end
  
end