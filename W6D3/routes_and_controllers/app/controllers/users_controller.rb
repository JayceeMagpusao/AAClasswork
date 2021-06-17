class UsersController < ApplicationController
    def index
        render json: User.all
    end
    
    def create
        user = User.new(params.require(:user).permit(:name, :email))
        if user.save!
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    # def create
    #     user = User.new(user_params)
    #     if user.save
    #         render json: user
    #     else
    #         render json: user.errors.full_messages, status: :unprocessable_entity
    #     end
    # end

    def show
        @user = User.find(params[:id])
		render json: @user
    end

    def update
        @user = User.find(params[:id])
        if @user.update(params.require(:user).permit(:name, :email))
            redirect_to user_url(@user)
        else
            render json: @user.errors.full_messages, status: :422
        end
    end


    

    # def user_params
    #     params.require(:user).permit(:name, :email)
    # end

end