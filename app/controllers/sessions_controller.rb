class SessionsController < ApplicationController
    skip_before_action :authorized, only: [:new, :create, :welcome, :google]
    def new
    end

    def login
    end

    def create
       @user = User.find_by(username: params[:username])
       if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect_to '/welcome'
       else
         @errors = "Username and/or Password is incorrect."
          render :new
       end
    end

    def destroy
        session.clear
        redirect_to '/welcome'
    end

    def google
      
      @user = User.find_or_create_by(email: auth["info"]["email"]) do |user|
        user.name= auth["info"]["first_name"]
        user.username= auth["info"]["name"]
        user.password= SecureRandom.hex(20)
      
   end
    
    if @user && @user.id
      session[:user_id] = @user.id
       redirect_to welcome_path
     else
        redirect_to welcome_path
      end
    end
   
    private

    def auth
      request.env['omniauth.auth']
    end

  end