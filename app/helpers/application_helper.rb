module ApplicationHelper
  
  def pick_other_locale_and_i18n_language_key

    case I18n.locale
      when :en then {:locale => :fr, :i18n_language_key => :french}
      when :fr then {:locale => :en, :i18n_language_key => :english}
    end
    
  end  
  
  def link_to_other_locale
        
    link_to(t("common.#{pick_other_locale_and_i18n_language_key[:i18n_language_key]}", 
              :locale => pick_other_locale_and_i18n_language_key[:locale]), 
            (@url_for_localization || controller_path_with_other_locale))

  end
  
  private
    def controller_path_with_other_locale
      "#{controller_path}?locale=#{pick_other_locale_and_i18n_language_key[:locale]}"
    end
  
end