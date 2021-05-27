class UsersController < ApplicationController
  def new
    @user = User.new( username:"Test", 
                      email:"test@test.com",
                      password:'omaromar' )
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_user_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
      if @user.update(username: params[:user]["username"], password: params[:user]["password"], email: params[:user]["email"])
        flash[:success] = "User was successfully updated"
        redirect_to new_user_path
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end
  

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
