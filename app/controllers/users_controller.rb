class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index 
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "thanks for signing up!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to :root, notice: "user updated"
    else
      redirect_to :edit
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    redirect_to movies_url, notice: "user deleted"
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
