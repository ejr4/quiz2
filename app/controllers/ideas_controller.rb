class IdeasController < ApplicationController
    before_action :authenticate_user!, except: [:show, :index]
    before_action :idea_find, only: [:show, :edit, :update, :destroy]
    before_action :authorize_user!, only: [:edit, :update, :destroy]
    def index
        @ideas = Idea.all.order(created_at: :desc)
    end
    def new
        @idea = Idea.new
    end
    def show
        
        @review = Review.new 
        @reviews = @idea.reviews.order(created_at: :desc)
    end
    def create 
        @idea = Idea.new idea_params
        @idea.user = current_user
        if @idea.save
            redirect_to idea_path @idea.id
        else
            render :new 
        end

    end
    def update
        if @idea.update idea_params 
            redirect_to idea_path @idea.id
        else
            render :edit
        end
    end
    def edit
    end
    
    def destroy
       
        @idea.destroy
        redirect_to ideas_path
    end
    private
    def idea_params
        params.require(:idea).permit(:title, :description, )
    end
    def idea_find
        @idea = Idea.find(params[:id])
    end
    def authorize_user!
        unless can?(:manage, @idea)
            flash[:alert] = "Permission denied"
            redirect_to idea_path(@idea)
        end
    end
end
