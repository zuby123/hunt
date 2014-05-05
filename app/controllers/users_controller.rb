class UsersController < ApplicationController
  # before_action :set_user, only: [:show, :edit, :update, :destroy]
 before_action :signed_in_user, only: [:edit, :update]
 before_action :correct_user,   only: [:edit, :update]
  # GET /users
  # GET /users.json
  def index
    @users = User.paginate(page: params[:page])
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
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
      sign_in @user
      flash[:success] = "Congrats! You've succesfully signed up"
      redirect_to @user
    else
      render 'new'
    end
  end


  #private

    


  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

     def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
