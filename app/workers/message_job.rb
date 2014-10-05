##
# file decides whether or not to send out an 
# sms message every 20 min 

class MessageJob
  include Sidekiq::Worker
  require 'twilio-ruby'
# require 'sinatra'
    
  #A. B.'s keys
  #check if we should send a message or not 
  def perform(user, questions)
    
  end
end