class PostsController < ApplicationController

    def index
        @posts = Post.all
    end

    def show
        @post = Post.find_by(id: params[:id])
    end

    def new
        @post = Post.new
        @users = User.all
    end

    def create
        @post = Post.create(post_params)
        
        if @post.valid?
            redirect_to post_path(@post)
        else
            # add error display
            redirect_to new_post_path(@post)
        end
    end

    private

    def post_params
        params.require(:post).permit(:user_id, :title, :category, :price, :desc)
    end
end
