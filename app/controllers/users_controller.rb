class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        user = User.new(user_params)

        if user.save
            session[:user_id] = user.id
            # --> redirect to home page?
        else
            # --> error message handling
            render :new 
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :location, :address, :zip_code, :phone_number, :email)
    end
end
