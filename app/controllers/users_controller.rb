class UsersController < ApplicationController
  before_action :require_user, only: [:show]
  before_action :redirect_user, only: [:new, :create, :reset]

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

  def send_reset
    UserMailer.forgot_password(params[:email]).deliver_now
    redirect_to reset_sent_path
  end

  def assign_email
    @user = User.find(params[:id]).decorate
    @return_to = URI(request.referrer).path || dashboard_path
    authorize @user
  end

  def set_email
    @user = User.find(params[:id])
    authorize @user
    @user.update(user_params)
    if params[:notify]
      membership = Membership.find(params[:membership_id])
      UserMailer.welcome(membership).deliver_now
    end
    flash[:notice] = "Email set for #{@user.decorate.full_name}"
    redirect_to params[:return_to] || dashboard_path
  end

  private

  def impersonating?
    params[:impersonating] == "true"
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def request_path
    return "membership_invite" if request.original_fullpath.starts_with?("/invite/")
    return "reset" if request.original_fullpath.starts_with?("/reset/")
  end
end
