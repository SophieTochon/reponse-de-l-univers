class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
    if @user.save
      log_in @user
    	redirect_to @user
    else
    	render "new"
    end
  end

  def show
    @user = current_user
  end

  def edit
  	@user = current_user
  end

  def update
  	@user = current_user
  	@user.update(user_params)
    redirect_to @user
  end

  def index
  	@users = User.all
  end

  def destroy
  	@user = current_user
  	@user.destroy
  	redirect_to users_path
  end

  private

  def user_params
  	params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
