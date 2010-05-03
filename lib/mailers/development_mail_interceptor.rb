class DevelopmentMailInterceptor
  
  def self.delivering_email(message)
    message.subject = "#{message.to} #{message.subject} - from development environment"
    message.to = "development@biocharquebec.org"
  end
  
end