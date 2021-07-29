class UsersController < ApplicationController

 def index
  @users = User.all
  @user = current_user
  @new_book = Book.new
 end

 def show
   @user = User.find(params[:id])
   @new_book = Book.new
   @books = @user.books
 end

 def new
  @user = User.new
 end

 def create
  @user = User.new(user_params)
  @user.save
  redirect_to user_path(current_user)
 end

 def edit
  @user = User.find(params[:id])
  if @user == current_user
   render "edit"
  else
   redirect_to user_path(current_user)
  end
 end

 def update
  @user = User.find(params[:id])
  if @user.update(user_params)
   redirect_to user_path(@user), notice: "You have updated user successfully."
  else
   render :edit
  end
 end


 private
 def user_params
  params.require(:user).permit(:profile_image, :name, :introduction)
 end

end
