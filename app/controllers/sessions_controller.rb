class SessionsController < ApplicationController
    before_action :redirect_if_not_signed_in, only: [:destroy]

    def new
    end

    def create
        @user = User.find_by(email: params[:user][:email])

        if @user
            return head(:forbidden) unless @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to home_path
        elsif params[:user][:email] == ""
            flash[:errors] = ["Username cannot be blank"]
            redirect_to "/signin"
        elsif params[:user][:password] == ""
            flash[:errors] = ["Password cannot be blank"]
            redirect_to "/signin"
        else
            flash[:errors] = ["Invalid login"]
            redirect_to "/signin"
        end 


    end

    def signout
        session[:user_id] = nil
        redirect_to signin_path
    end      
end