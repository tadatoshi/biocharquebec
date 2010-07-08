module ApplicationHelper
  
  # Added because setting cache fails in the staging environment. 
  #  i.e. ActionView::Template::Error (can't convert nil into String) on line #3 of ...../app/views/layouts/_head.html.erb:
  # (20100708): Same thing happened in the production. Commenting out the section for the production:
  def javascript_include_tag_options
    # if Rails.env == "production"
    #   {:cache => "shared-cache"}
    # else
      {}
    # end
  end
  
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
  
  def body_css_class
    # TODO: Find a better way:
    if controller.controller_name == "comments"
      "blog-posts-body"
    else
      "#{controller.controller_name.dasherize}-body"
    end
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