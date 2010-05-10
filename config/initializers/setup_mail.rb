ActionMailer::Base.smtp_settings = {  
  :address              => "smtp.gmail.com",  
  :port                 => 587,  
  :domain               => "biocharquebec.org",  
  :user_name            => "admin@biocharquebec.org",  
  :password             => "33Y273",  
  :authentication       => "plain",  
  :enable_starttls_auto => true  
}

ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?