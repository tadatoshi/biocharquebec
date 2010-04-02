class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_locale
  
  helper_method :current_user
  
  def default_url_options(options={})  
    logger.debug "default_url_options is passed options: #{options.inspect}\n"  
    { :locale => I18n.locale } 
  end

  private
    def set_locale 
      # if params[:locale] is nil then I18n.default_locale will be used  
      I18n.locale = params[:locale] 
    end
    
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.record
    end    

end
