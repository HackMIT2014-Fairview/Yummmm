##
# file decides whether or not to send out an 
# sms message every 20 min 

class MessageJob
  include Sidekiq::Worker
  
  def perform(name)
    sleep(200)
    #check if we should send a message or not 
    random_bool = [true, false].sample   
    if random_bool
      job.
    end
    
  end



end

