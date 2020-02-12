class UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show

  end

  def index
    @users = User.all
  end

  def edit
    if current_user != @user
      redirect_to :index, flash[:notice] = "You're not authorized to view this page"
    end
  end

  def update

  end

  def destroy

  end

  private

  def load_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :email, :username, :phone, :location, :first_name, :last_name, :img_url,
      :instragram_url, :facebook_url, :website_url, :tik_tok_url, :description,
      :password, :password_confirmation
    )
  end
end
