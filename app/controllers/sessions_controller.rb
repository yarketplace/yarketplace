class SessionsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by(email: params[:user][:email])

        return head(:forbidden) unless @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
    end

    def destroy
        session[:user_id] = nil
        redirect_to signin_path
    end      
end