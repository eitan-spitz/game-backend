class UsersController < ApplicationController
    def index
        users = User.all
        render json: users
    end

    def show
        user = User.find(params[:id])
        render json: user
    end

    def create
        user = User.create!(user_params)
        render json: user
    end
    
    def destroy
        user = User.find(params[:id])
        user.destroy!
        render json: {}
    end

    def update
        user = User.find(params[:id])
        user.update!(pin: params[:pin])
        render json: user
    end

    private

    def user_params
        params.permit(:username, :pin, :total_points)
    end
end
