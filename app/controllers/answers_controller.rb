class AnswersController < ApplicationController
  def index


    # let's pretend that we've mapped this action to
    # http://localhost:3000/sms in the routes.rb file

    message_body = params["Body"]
    from_number = params["From"]
    @answer = Answer.new
    @answer.response = message_body
    @answer.from = from_number
    @answer.save

    @lastQuestion = Question.order("updated_at").last
    start =  @lastQuestion.updated_at
    finish =  @answer.created_at
    if (finish - start) < 60
        points = 100
    elsif (finish - start) < 1800
        points =  75
    else
        points = 50
    end

    # for @users.each do |user|
      # user.max_score += 100
    # end
    @completer = User.where(:subject => @lastQuestion.subject, :phone_number => from_number).first
    if @answer.response == @lastQuestion.answer
       @completer.score += points
       account_sid = 'AC6c15a831dc43075a3e628d59e410e8ef'
       auth_token = '8cc5c6bfc1b4659c35946fc12c5986ae'

       @client = Twilio::REST::Client.new account_sid, auth_token

       sender = '+1 720-459-5475'
       @client.account.messages.create(
            :from => sender,
            :to => from_number,
            :body => "Congrats, way to know your stuff! You now have " + @completer.score + " points."
            )
    else
        @completer.score -= points / 4
        account_sid = 'AC6c15a831dc43075a3e628d59e410e8ef'
        auth_token = '8cc5c6bfc1b4659c35946fc12c5986ae'

        @client = Twilio::REST::Client.new account_sid, auth_token

        sender = '+1 720-459-5475'
        @client.account.messages.create(
              :from => sender,
              :to => from_number,
              :body => "Better luck next time! You now have " + @completer.score + " points."
              )

    end
  end
end
