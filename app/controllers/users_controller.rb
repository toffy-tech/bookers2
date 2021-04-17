class UsersController < ApplicationController
  
  before_action :authenticate_user!
  
  
  def index
    @users = User.all
    @user = current_user
    @book=Book.new
  end
  def show
    @user = User.find(params[:id])
    @users=User.all
    @book=Book.new
    @books=@user.books
  end
  
  def edit
    
    @user = User.find(params[:id])
    
    if @user != current_user
      redirect_to user_path(current_user)
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] ="You have changed your profile successfully."
       redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
  
end