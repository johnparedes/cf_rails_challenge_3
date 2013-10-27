class UsersController < ApplicationController

before_action :find_user, only: %w(edit update show)

  def index
    @user = User.order("last_name ASC")
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Successfully created new user."
      redirect_to root_path
    else
      flash[:notice] = @user.errors.full_messages
      render "new"
    end
  end

  def edit
  end

  def update
    if @user.update user_params
      flash[:notice] = "User record updated."
      redirect_to root_path
    else
      flash[:notice] = @user.errors.full_messages
      render "edit"
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:notice] = "User deleted."
    redirect_to root_path
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :first_name, :last_name, :email_type, :email, :status
    )
  end

end
