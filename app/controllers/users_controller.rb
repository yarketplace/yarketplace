class UsersController < ApplicationController
    before_action :redirect_if_not_signed_in, except: [:new, :create]

    def home
        @user = User.find_by(id: session[:user_id])
    end

    def new
        @user = User.new
        @user_class = User.all
    end

    def create
        @user_class = User.all
        @user = User.new(user_params)

        if @user.save
            session[:user_id] = @user.id
            redirect_to home_path
        else
            # --> error message handling
            flash[:errors] = @user.errors.full_messages
            redirect_to new_user_path
        end
    end

    def edit
        @user = User.find_by(id: params[:id])
        @user_class = User.all
    end

    def update
        @user = User.find_by(id: params[:id])
        @user.update(user_params)

        if @user.valid?
            @user.save
            redirect_to home_path
        else
            # error messages

            redirect_to edit_user_path
        end

    end
    
    def destroy
        @user = User.find_by(id: params[:id])
        @user.destroy
        session[:user_id] = nil
        redirect_to signin_path
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
