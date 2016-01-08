# class SessionController < ApplicationController
#
#   def login
#     @user = User.find_by(user: params[:user])
#     if @user && @user.authenticate(params[:password])
#       session[:user_id] = @user.id
#       redirect_to "/mymoments", flash: {success: "You have successfully logged in."}
#     else
#       render "home/login", flash: {warning: "Wrong username/password."}
#     end
#   end
#
#   def logout
#     session.delete(:user_id)
#     redirect_to "/", notice: "You have successfully logged out."
#   end
#
# end
