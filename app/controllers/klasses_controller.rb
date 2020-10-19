class KlassesController < ApplicationController
    before_action :set_class, only: [:show, :edit, :update, :destroy]

    
      def index
        @klass = Klass.all
      end
    
      def show
      end

      def new
        if current_user.instructor
        @klass = Klass.new
        else
          redirect_to '/welcome'
        end
      end
    
      def create
        @klass = Klass.new(klass_params)
         if @klass.save
        #byebug
        redirect_to klasses_path(@klass)
         end
      end

      def edit
        if current_user.instructor
          else
          redirect_to '/welcome'
        end

      end
    
      def update
        @klass.update(klass_params)
        redirect_to klass_path(@klass)
        
      end
    
      def destroy
        
        if @klass.destroy
          redirect_to klasses_path
        else
          flash[:notice] = "Was unable to delete class!"
          redirect_to @klass
        end
      end
      
      private

      def set_class
        @klass = Klass.find(params[:id])
      end

      def klass_params 
         params.require(:klass).permit(:name, :instructor, :scheduled_time)
      end
end
