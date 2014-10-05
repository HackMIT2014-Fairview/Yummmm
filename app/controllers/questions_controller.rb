class QuestionsController < ApplicationController

  def index
    @questions = Question.paginate(:page => params[:page])
    @title = "All questions"
  
  end
  
  def show
    @question = Question.find(params[:id])
    @title = @question.prompt
  end

  def new
    @question  = Question.new
    @title = "Sign up"
  end
  
  def create
    @question = Question.new(params[:question])
    if @question.save
      redirect_to @question, :flash => { :success => "Welcome to the Sample App!" }
    else
      @title = "Sign up"
      render 'new'
    end
  end
  
  def edit
    @title = "Edit question"
  end
  
  def leaders
    @title = "Hmmm"
    @questions = Question.all
  end
  
  def update
    if @question.update_attributes(params[:question])
      redirect_to @question, :flash => { :success => "Profile updated." }
    else
      @title = "Edit question"
      render 'edit'
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path, :flash => { :success => "Question destroyed." }
  end

  private

    def correct_question
      @question = Question.find(params[:id])
      redirect_to(root_path) unless current_question?(@question)
    end
    
    def admin_question
      @question = Question.find(params[:id])
      redirect_to(root_path) if !current_question.admin? || current_question?(@question)
    end
end
