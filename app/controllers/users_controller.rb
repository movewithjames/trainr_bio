class UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit, :update, :destroy]

  def show
    @events = @user.trainer_events
  end

  def index
    if !params[:search].blank?
      @users = User.search(params[:search]).order("first_name ASC")
      @studios = Studio.search(params[:search]).order("name ASC")
    # elsif !params[:category].blank?
    #   @users = users.where(category: params[:category]).order("category ASC")
    else
      @users = User.where(role: 1).order("first_name ASC")
      @studios = Studio.all.order("name ASC")
    end
  end

  def edit
    @studios = Studio.all.order("name ASC")
    if current_user != @user
      redirect_to :index, notice: "Not authorized."
    end
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to user_path(@user), notice: "Account updated!"
    else
      render :edit
    end
  end

  def destroy
  end

  def home
  end

  def pre_launch_landing
  end

  def pre_launch_reservation
  end

  def landing_email
    body = params[:comment]

    UserMailer.landing_email(body).deliver_later

    redirect_to :home, notice: "Thanks for the feedback!"
  end

  def forgot_password
  end

  def verification
  end

  private

  def load_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :email, :username, :phone, :location, :first_name, :last_name, :img_url,
      :instragram_url, :facebook_url, :website_url, :tik_tok_url, :description,
      :password, :password_confirmation, :role
    )
  end
end
