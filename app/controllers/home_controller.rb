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
        redirect_to "/mymoments", notice: "You have successfully signed up!"
      else
        render "sign_up"
      end
    end
  end

  def login
    @user = User.find_by(user: params[:user])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to "/mymoments", flash: {success: "You have successfully logged in."}
    else
      # flash.now[:notice] = "Wrong username/password."
      render "login"
    end
  end

  def logout
    session.delete(:user_id)
    redirect_to "/", notice: "You have successfully logged out."
  end

  def account

  end

  # def update_email
  #   @user = User.find(:user_id)
  # end

end
