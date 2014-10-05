class ReceiveTextController < ApplicationController
  def index 
    
    
    # let's pretend that we've mapped this action to 
    # http://localhost:3000/sms in the routes.rb file
    
    message_body = params["Body"]
    from_number = params["From"]
    @answer = Answer.new
    @answer.response = message_body
    @answer.from = from_number
    @answer.save
  end
end