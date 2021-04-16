class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
      @users = User.all
      authorize User
  end

  def show
      @user = User.find(params[:id])
      authorize @user
  end

  def edit

  end

  def destroy
      user = User.find(params[:id])
      user.destroy
      redirect_to users_path, :notice => "user deleted"
  end
  def update
      @user = User.find(params[:id])
      authorize @user
      if @user.update(post_params)
        redirect_to @user
      else
        render :edit
      end
    end

end