##
# file decides whether or not to send out an 
# sms message every 20 min 

class MessageJob
  include Sidekiq::Worker
  require 'twilio-ruby'
# require 'sinatra'
    
  #A. B.'s keys
  #check if we should send a message or not 
  def perform()
    random_bool = [true].sample   
    if random_bool
	    account_sid = 'AC6c15a831dc43075a3e628d59e410e8ef'
	    auth_token = '8cc5c6bfc1b4659c35946fc12c5986ae'
      
	    @client = Twilio::REST::Client.new account_sid, auth_token
      
	    sender = '+1 720-459-5475'
      
      subjects = ["History", "SAT Prep", "Math"]
      subjects.each do |type|
        array_size = @questions[:subject=>type,:used=>false].count
        text = @questions.first.prompt
        users = @users[:subject=>type]
        users.each do |user|
      	  @client.account.messages.create(
      	    :from => sender,
      	    :to => user.phone_number,
      	    :body => text
      	    )
          end
        @questions.first.used = true
      end
    end
  end
end