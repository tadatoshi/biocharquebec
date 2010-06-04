class ApplicationController < ActionController::Base
  include SslRequirement
  
  protect_from_forgery
  
  before_filter :set_locale
  
  def default_url_options(options={})  
    logger.debug "default_url_options is passed options: #{options.inspect}\n"  
    options.merge!({ :locale => I18n.locale })
    # options.merge!({ :host => "biocharquebec.org" }) if Rails.env.production? || Rails.env.staging?
    options
  end

  private
    def set_locale 
      # if params[:locale] is nil then I18n.default_locale will be used  
      I18n.locale = params[:locale] 
    end

end
