class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new]
  def index
    @book = Book.new
    @user = current_user
    @users = User.all
  end
  def show
    @users = User.all
    @user = User.find(params[:id])  
    @book = Book.new
 
  end
  def edit
    @user = User.find(params[:id])
   if  @user == current_user
    render 'edit'
   else 
    redirect_to user_path(current_user.id)
   end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id), notice: "You have updated user successfully."
   else
    render 'edit'
    end
  end

  private 
  def user_params
      params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
