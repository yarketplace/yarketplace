class UsersController < ApplicationController
    def home
        @user = User.find_by(id: session[:user_id])
    end

    def new
        @user = User.new
        @user_class = User.all
    end

    def create
        @user_class = User.all
        user = User.new(user_params)

        if user.save
            session[:user_id] = user.id
            redirect_to home_path
        else
            # --> error message handling
            redirect_to new_user_path
        end
    end

    def my_posts
        @user = User.find_by(id: session[:user_id])
        @my_posts = @user.posts
    end

    private

    def user_params
        params.require(:user).permit(:name, :location, :address, :zip_code, :phone_number, :email, :password, :password_confirmation)
    end
end
