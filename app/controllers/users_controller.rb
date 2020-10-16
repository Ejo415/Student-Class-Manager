class UsersController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]


def new
   @user = User.new 
end

def create 
    @user = User.new(params.require(:user).permit(:username, :password, :email, :name, :age, :skill_level))
        if @user.save
        session[:user_id] = @user.id
        redirect_to '/welcome'
    else
        @errors = @user.errors.full_messages.uniq
           render new_user_path
        end
end

def show 
    #byebug
    @user = User.find(params[:id])
    @klass = Klass.all
    #byebug
end

end