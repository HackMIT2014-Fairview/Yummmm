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
	friends = {
	  '+1 720 341 7509' => 'Katie',   
	  '+13038070600' => 'Larry',
	  '+13035799305' => 'Jaimie',
	  '+17203261705' => 'Rose'
	}
	text = 'what is the answer? [a, b, c, d]' #question goes here

	for number in friends.keys
	  @client.account.messages.create(
	    :from => sender,
	    :to => number,
	    :body => text
	    )
	end    
    
    end
    
  end



end

