class UsersController < ApplicationController

    def new
        @user = User.new 
    end

    def create
        @user = User.create(email: params["email"], password: params["password"], first_name: params["first_name"], 
        last_name: params["last_name"])

        if @user.save
            redirect_to root_path
        else @user.errors.any?
            render :new
        end
    end
    
    def show 
    end

end
