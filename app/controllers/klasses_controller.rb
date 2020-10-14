class KlassesController < ApplicationController
    before_action :set_class, only: [:show, :create, :edit, :update, :destroy]

    
      def index
        @klass = Klass.all
      end
    
      def show
        #@klass = Klass.find(params[:id])
      end

      def new
        @klass = Klass.new
      end
    
      def create
        @klass = Klass.new(klass_params)
         if @klass.save
        #byebug
        redirect_to klasses_path(@klass)
         end
      end

      def edit
       # @klass = Klass.find(params[:id])
        
      end
    
      def update
        #@klass = Klass.find(params[:id])
        @song.update(klass_params)
        redirect_to klass_path(@klass)
      end
    
      def destroy
        klass = Klass.find(params[:id])
      end

      private

      def set_class
       # @klass = Klass.find(params[:id])
      end

      def klass_params 
         params.require(:klass).permit(:name, :instructor, :scheduled_time)
      end
end
