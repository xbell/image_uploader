class RatingMailer < ApplicationMailer

  def rating_email(user_id)
    @user = User.find(user_id)
    mail(to: @user.email, subject: "One of your photos has been rated!")
  end

end
