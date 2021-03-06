class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :send_password]
  before_action :authenticate_user!
  before_action :admin_only, except: [:show, :update_password, :change_password]

  def index
  	@users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

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
  		render action: 'new'
  	end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
  	if params[:user][:password].blank?
  		params[:user].delete(:password)
  		params[:user].delete(:password_confirmation)
  	end

  	if @user.update(user_params)
  		redirect_to @user, notice: 'User was successfully updated.'
  	else
  		render action: 'edit'
  	end
  end

  def change_password
    @user = User.find(current_user.id)    
  end

  def update_password
    @user = User.find(current_user.id)
    if @user.update(user_params)
      # Sign in the user by passing validation in case their password changed
      sign_in @user, :bypass => true
      redirect_to root_path, notice: 'Password was successfully changed'
    else
      render "change_password"
    end
  end

  def send_password
    if @user.send_reset_password_instructions
      redirect_to users_path, notice: 'Password reset instructions sent to ' + @user.name
    else
      redirect_to users_path, alert: 'Can\'t send reset instructions'
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    redirect_to users_url
  end

  private

    def admin_only
      unless current_user && current_user.admin?
        redirect_to root_path || :back, :alert => "Access denied."
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :role, :password, :password_confirmation)
    end

end
