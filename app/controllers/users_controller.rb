class UsersController < ApplicationController
    def show
    end

    def create
    end

    def update
    end

    def destroy
    end

    def follow_movies
        list = FollowMovie.where(user_id: params[:user_id])
        if list.present?
            render json: list
        else
            render json: {
                status: "null"
            }
        end
    end
end
