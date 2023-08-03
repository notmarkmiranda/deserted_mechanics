class MembershipsController < ApplicationController
  before_action :load_league

  def index
    @memberships = @league.memberships.with_deleted.includes(:user).decorate.group_by(&:role)
  end

  def new
    @membership = @league.memberships.new
    authorize @membership
  end

  def create
    @membership = @league.memberships.new(membership_params)
    authorize @membership
    set_user_password
    if @membership.save
      UserMailer.welcome(@membership).deliver_now if @membership.user_email && params[:notify]
      flash[:notice] = "User invited!"
      redirect_to @league
    else
      flash[:alert] = @membership.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    @membership = Membership.find(params[:id]).decorate
    authorize @membership
  end

  def update
    @membership = Membership.find(params[:id])
    if @membership.update(membership_params)
      flash[:notice] = "Membership updated!"
      redirect_to league_memberships_path(@league)
    else
      flash[:alert] = @membership.errors.full_messages.join(", ")
      render :edit
    end
  end

  def destroy
    @membership = Membership.find(params[:id])
    authorize @membership
    @membership.destroy
    redirect_to league_memberships_path(@league)
  end

  def reactivate
    @membership = Membership.with_deleted.find(params[:id])
    authorize @membership
    @membership.restore
    redirect_to league_memberships_path(@league)
  end

  private

  def set_user_password
    @membership.user.password = SecureRandom.hex(13)
  end

  def load_league
    @league ||= League.find(params[:league_id])
  end

  def membership_params
    params.require(:membership).permit(
      :league_id,
      :user_id,
      :role,
      :active,
      user_attributes: [
        :email,
        :first_name,
        :last_name,
        :password
      ]
    )
  end
end
