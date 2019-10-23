class UsersController < ApplicationController
  def user_params
    params.require(:user).permit(:name, :email, :country, :state)
  end
  
  
  def new
    @user = User.new
  end
  
  def index
    @users = User.all
    
  end
  
  def show
    id = params[:id]
    @user = User.find(id)
    #games
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "#{@user.name} was successfully created."
      redirect_to users_path
    else 
      flash[:warning] = "Email and name could not be null."
      render new_user_path
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:warning] = "#{@user.name} was successfully updated."
      redirect_to user_path(params[:id])
    else
      flash[:warning] = "Email and name could not be empty."
      redirect_to edit_user_path(@user)
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "User '#{@user.name}' deleted."
    redirect_to users_path
  end
  
end
