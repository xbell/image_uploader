class HomeController < ApplicationController

  def index

  end

  def create_user
    @users = User.all
    @users.each do |user|
      if user.user == params[:username] || user.email == params[:email]
        redirect_to "/log-in", notice: "You have already signed up. Please log in."
        return
      end
    end
    @user = params[:username]
    @email = params[:email]
    if params[:password] != params[:password_confirmation]
      flash.now[:notice] = "Passwords do not match."
      render "home/sign_up"
    else
      @user = User.new
      @user.user = params[:username]
      @user.email = params[:email]
      @user.password = params[:password]
      if @user.save
        session[:user_id] = @user.id
        redirect_to "/mymoments/#{@user.id}", notice: "You have successfully signed up!"
      else
        render "sign_up"
      end
    end
  end

  def login
    @user = User.find_by(user: params[:user])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to "/mymoments/#{@user.id}", flash: {success: "You have successfully logged in."}
    else
      render "login", flash: {notice: "Wrong username/password."}
    end
  end

  def logout
    session.delete(:user_id)
    redirect_to "/", notice: "You have successfully logged out."
  end

end
