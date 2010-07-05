require "ruby-debug"

class Middleware::IpAddressAuthenticationFilter
  
  def initialize(app)
    @app = app
  end
  
  def call(env)
    
    puts "env: #{env}"
    
    status, headers, response = @app.call(env)  
    
    puts "status: #{status}"
    puts "headers: #{headers}"
    puts "response.location: #{response.location}"
    puts "response.content_type: #{response.content_type}"
    puts "response.charset: #{response.charset}"
    puts "response.message: #{response.message}"
    puts "response.body: #{response.body}"

    [status, headers, response.body] 

  end
  
end