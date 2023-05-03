class UsersController < ApplicationController
    def index
        @users = User.all
        render json: @users
    end

    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user
        else 
            render json: @user.errors.full_messages, status: 422
        end
    end

    def user_params
        params.require(:banana).permit(:name, :email)
    end 

    def show
        render json: params
    end
end