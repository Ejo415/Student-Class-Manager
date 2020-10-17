class UsersController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]
    before_action :set_user, only: [:show, :update, :edit]


def new
   @user = User.new 
end

def create 
    @user = User.new(user_params)
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

def edit
end

def update
    
  if @user.update(user_params)
  #byebug
  redirect_to user_path(@user)
else
    @errors = @user.errors.full_messages.uniq
       render '/users/edit'
    end
end

private

def set_user
    @user = current_user
end

def user_params
    params.require(:user).permit(:username, :password, :email, :name, :age, :skill_level, :instructor)
end

end