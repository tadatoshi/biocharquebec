class DevelopmentMailInterceptor
  
  def self.delivering_email(message)
    message.subject = "#{message.to} #{message.subject} - from development environment"
    message.to = "biocharquebec@tadatoshi.org"
  end
  
end