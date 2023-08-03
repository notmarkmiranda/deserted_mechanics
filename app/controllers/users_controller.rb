class UsersController < ApplicationController
  before_action :require_user, only: [:show]

  def show
    @leagues = current_user.leagues
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "signed up!"
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      flash[:alert] = "something went wrong"
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      session[:user_id] = @user.id
      flash[:notice] = "Password set"
      redirect_to dashboard_path
    else
      flash[:alert] = "Something went wrong"
      redirect_to sign_up_path
    end
  end

  def reset
    redirect_to sign_in_path unless params[:token]
    @user = GlobalID::Locator.locate_signed(params[:token], for: request_path)
    redirect_to sign_up_path unless @user
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def request_path
    return "membership_invite" if request.original_fullpath.starts_with?("/invite/")
  end
end
