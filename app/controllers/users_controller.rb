class UsersController < ApplicationController
  def index
    users = User.all
    render locals: { users: users }
  end

  def show
    user = get_user
    render locals: { user: user }
  end

  def new
    user = User.new
    render locals: { user: user }
  end

  def create
    user = User.new(user_params)
    if user.save
      flash[:success] = "User has been created!"
      redirect_to user_path(user)
    else
      flash[:error] = "Something went wrong..."
      redirect_to new_user_path(user)
    end
  end

  def edit
    user = get_user
    render locals: { user: user }
  end

  def update
    user = get_user
    if user.update_attributes(user_params)
      flash[:success] = "User has been updated!"
      redirect_to :user
    else
      flash[:error] = "Something went wrong..."
      redirect_to edit_user_path(user)
    end
  end

  def destroy
    user = get_user
    if user.destroy
      flash[:success] = "User has been deleted!"
      redirect_to users_path
    else
      flash[:error] = "Something went wrong..."
      redirect_to user_path(user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def get_user
    User.find(params[:id])
  end
end
