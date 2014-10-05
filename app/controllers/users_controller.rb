class UsersController < ApplicationController
  respond_to :html
  require 'twilio-ruby'
  def index
    @questions = Question.all
    @users = User.all
    random_bool = [true].sample   
    if random_bool
	    account_sid = 'AC6c15a831dc43075a3e628d59e410e8ef'
	    auth_token = '8cc5c6bfc1b4659c35946fc12c5986ae'
      
	    @client = Twilio::REST::Client.new account_sid, auth_token
      
	    sender = '+1 720-459-5475'
      
      subjects = ["History", "SAT Prep", "Math"]
      subjects.each do |type|
        array_size = Question.where(:subject=>type,:used=>false).count
        u = Question.where(:subject=>type,:used=>false).first
        text = u.prompt
        users = User.where(:subject=>type)
        users.each do |user|
      	  @client.account.messages.create(
      	    :from => sender,
      	    :to => user.phone_number,
      	    :body => text
      	    )
          end
        
      end
    end
    @title = "All users"
  
  end
  
  def show
    @questions = Question.all
    @user = User.find(params[:id])
    @title = @user.name
    #MessageJob.perform_async(@user, @questions)
    
    
  end

  def new
    @user  = User.new
    @title = "Sign up"
  end
  
  def create
    @questions = Question.all
    @user = User.new(params[:user])
    if @user.save
      #MessageJob.perform_async(@user, @questions)
      redirect_to @user, :flash => { :success => "Welcome to the Sample App!" }
    else
      @title = "Sign up"
      render 'new'
    end
  end
  
  def edit
    @title = "Edit user"
  end
  
  def leaders
    @title = "Hmmm"
    @users = User.all
  end
  
  def update
    if @user.update_attributes(params[:user])
      redirect_to @user, :flash => { :success => "Profile updated." }
    else
      @title = "Edit user"
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, :flash => { :success => "User destroyed." }
  end

  private

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
    
    def admin_user
      @user = User.find(params[:id])
      redirect_to(root_path) if !current_user.admin? || current_user?(@user)
    end
end
