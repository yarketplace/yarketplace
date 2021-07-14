class CommentsController < ApplicationController

	def create
		@post = Post.find(params[:post_id])

	 	
		redirect_to post_path(@post)	
	end


    private

    def comment_params
        params.require(:comment).permit(:user_id, :post_id, :content)
    end

end
