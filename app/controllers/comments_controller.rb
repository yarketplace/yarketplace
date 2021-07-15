class CommentsController < ApplicationController

	def create
		@post = Post.find(params[:post_id])

        user_id = session[:user_id]
        # byebug
        @comment = Comment.create(user_id: user_id, post_id: params[:post_id], content: params[:comment][:content])

        

	 	
		redirect_to post_path(@post)	
	end


    private

    def comment_params
        params.require(:comment).permit(:user_id, :post_id, :content)
    end

end
