class PostsController < ApplicationController
    before_action :redirect_if_not_signed_in

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
        @post = Post.new(post_params)
        # post author is the current user (not needed in form anymore)
        @post.user = current_user
        
        if @post.valid?
            # byebug
            @post.save
            if params[:post][:photo]
                params[:post][:photo][:image].each do |img|
                    @image = @post.images.create!(uploaded_image: img)
                end
            end
        redirect_to post_path(@post)
        else
            # add error display
            flash[:errors] = @post.errors.full_messages
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

    def destroy
        @post = Post.find(params[:id])
        @post.destroy

        #respond_to do |format|
        #format.html { redirect_to posts_url }
        #format.json { head :no_content }
        #end
        redirect_to posts_path
    end

    private

    def post_params
        params.require(:post).permit(:title, :category, :price, :desc, image_attributes: [:image])
        # ^ got rid of user_id
    end
end
