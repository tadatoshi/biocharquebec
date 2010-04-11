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
            (@url_for_localization || url_with_other_locale(request.url)))

  end
  
  private
    def url_with_other_locale(url)
      other_locale_parameter = "locale=#{pick_other_locale_and_i18n_language_key[:locale]}"
      if url.match(/locale=\w{2}/)
        url.sub(/locale=\w{2}/, other_locale_parameter)
      elsif url.match(/\?/)
        "#{url}&#{other_locale_parameter}"
      else
        "#{url}?#{other_locale_parameter}"
      end
    end
  
end