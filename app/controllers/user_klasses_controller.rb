class UserKlassesController < ApplicationController
  
    def new
        set_klass
        @uk = @klass.user_klasses.build
    end

    def create 
        if params[:klass_id]
            set_klass
            @uk = current_user.user_klasses.build(klass_id: params[:klass_id],reminder: params[:user_klass][:reminder])
          else 
        @uk = UserKlass.new(uk_params)
          end
          #byebug
        if @uk.save
       redirect_to user_path(current_user)
        end
      #  if @uk.reminder == true
        #    UserMailer.reminder(current_user).deliver_now
        #end
    
    end

    def index
       # byebug
        if current_user == User.find_by_id(params[:user_id])
        @user = User.find_by_id(params[:user_id])
        
        @user_klasses = @user.user_klasses
        else
            redirect_to '/welcome'
        end
    end

    def show 
        #byebug
        @user_klasses = UserKlass.find(params[:id])
        if current_user.id == @user_klasses.user_id
            else
                redirect_to '/welcome'
            end
       # @user_klasses = UserKlass.find(params[:id])
       # @user = current_user
    end

    
    def destroy
        @user_klass = UserKlass.find(params[:id])
        if current_user.id == @user_klass.user_id
         @user_klass.destroy
          redirect_to user_user_klasses_path(current_user)
        else
          redirect_to user_user_klasses_path(current_user)
        end
      end

    private 

    def uk_params
        params.require(:user_klass).permit(:user_id, :klass_id, :reminder) 
    end

    def set_klass
      @klass = Klass.find_by_id(params[:klass_id])
    end
   
   
   

end