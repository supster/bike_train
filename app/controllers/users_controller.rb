class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update]
  before_filter :correct_user, only: [:edit, :update]
  before_filter :admin_user, only: [:destroy]

  def index
    @users = User.paginate(page: params[:page])
    respond_to do |format|
          format.html 
          format.json { render json: @users }
      end
  end
  
  def show
    @user = User.find(params[:id])
    respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @user }
    end
  end

  def new
    @user = User.new

    respond_to do |format|
          format.html 
          format.json { render json: @user }
    end
  end

  def create
    @user = User.new(params[:user])
=begin
    if @user.save
      flash[:success] = "Welcome to Bike Train"
      sign_in @user
      redirect_to @user
    else
      render "new"      
    end
=end


    respond_to do |format|
        if @user.save
            sign_in @user
            format.html { redirect_to @user, notice: 'User was successfully created.' }
            format.json { render json: @user, status: :created, location: @user }
        else
            format.html { render action: "new" }
            format.json { render json: @user.errors, status: :unprocessable_entity }
        end
    end
  end
  
  def update
=begin
    if @user.update_attributes(params[:user])
      #handle successful update
      sign_in @user
      flash[:success] = "Profile Updated"
      redirect_to @user
    else
      render "edit"
    end
=end

    respond_to do |format|
      if @user.update_attributes(params[:user])
        sign_in @user
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed"
    redirect_to users_path
  end
  
  private  
  def correct_user
    @user = User.find(params[:id])
    redirect_to root_path unless current_user?(@user)
  end  
  
  def admin_user
    redirect_to root_path unless current_user.admin?
  end
end
