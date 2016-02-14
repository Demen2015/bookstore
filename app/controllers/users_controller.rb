class UsersController < ApplicationController
  add_breadcrumb "Home", :root_path
  def login
    add_breadcrumb "Login", login_path

  end

  def new
    add_breadcrumb "Register", signup_path
    @user = User.new

  end

  def add
    @user = User.new(user_params)
    # @present_user = User.find_by(username: params[:user][:username])

    # if @present_user.present?
    #   flash[:danger] = 'Username exists.Please enter new username'
    #   render 'new'
    # end

    if @user.save
      @session =  User.find_by(username: params[:user][:username])
      session[:userId] = @session[:id]
      session[:username] = @session[:username]
      flash[:success] = "Save successful"
      redirect_to root_path
    else
      flash[:danger] = 'Save Unsuccessful'
      render 'new'
    end

  end

  def create
     add_breadcrumb "Login", login_path
      # byebug
      user  = User.find_by(username: params[:user][:email])

      password = User.find_by(password: params[:user][:password]
        )
      if user && password
          session[:userId] = User.select("id").where(username: params[:user][:email])
          session[:username] = params[:user][:email]
          flash[:success] = "Signup passed successful"

          redirect_to page_home_path
      else
          flash[:danger] = 'Invalid emai/password combination'
           render 'login'
      end


  end

  def destroy
        session[:userId] ={}
        session[:username] ={}
        redirect_to root_path

  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :address, :tel)
  end
end
