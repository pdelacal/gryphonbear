class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :redirect_unless_logged_in, only: [:show, :edit]

  # GET /users
  # GET /users.json
  def index
    @users = User.all

    @message = if session[:id] == 1
      "You are logged In"
    else
      "Please log in."
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    # render :show
  end
  # redirect_to root_path unless is_logged_in?     - Can all be on 1 line. root_path is homepage

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
      redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email)
  end

  def redirect_unless_logged_in
    unless is_logged_in?
      redirect_to users_url
    end
  end
end
