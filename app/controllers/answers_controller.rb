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
    points = 100 - (finish - start)
    for @users.each do |user|
      user.max_score += 100
    end
    @completer = User.which(:subject => @lastQuestion.subject, :phone_number => @answer.from)
    @completer.score += points 
  end
end
