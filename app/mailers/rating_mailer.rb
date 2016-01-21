class RatingMailer < ApplicationMailer

  def rating_email(user_id, review_id)
    @user = User.find(user_id)
    mail(to: @user.email, subject: "One of your photos has been rated!")

    @review = Review.find(review_id)
    @rating = "okay"
    if @review.rating == 1
      @rating = "thumbs up"
    elsif @review == -1
      @rating = "thumbs down"
    end
    @picture = Picture.find(@review.picture_id)
  end

end
