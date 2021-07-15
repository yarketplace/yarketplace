class FavsController < ApplicationController
    def create
        @current_user = User.find_by(id: session[:user_id])
        @post = Post.find_by(id: params[:post_id])

        if @post.user.id != @current_user.id   #You can register favorites other than your own posts
          @like = Fav.create(user_id: @current_user.id, post_id: @post.id)
        end
        redirect_to post_path(@post)
    end

    def destroy
      @current_user = User.find_by(id: session[:user_id])
      @post = Post.find_by(id: params[:post_id])
      @like = @current_user.favs.find_by(post_id: @post.id)
      @like.destroy
      redirect_to post_path(@post)
    end
end