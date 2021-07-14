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
            # byebug
            params[:post][:photo][:image].each do |img|
                @image = @post.images.create!(uploaded_image: img)
            end
        redirect_to post_path(@post)
        else
            # add error display
            redirect_to new_post_path(@post)
        end
    end

    def edit
        @post = Post.find_by(id: params[:id])
        @users = User.all
    end

    def update
        @post = Post.find(params[:id])
        @post.update(post_params)

        redirect_to @post
    end

    private

    def post_params
        params.require(:post).permit(:user_id, :title, :category, :price, :desc, image_attributes: [:image])
    end
end
