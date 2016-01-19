class ReviewController < ApplicationController

  def review_images
    # First get a list of all pictures the current user has reviewed
    reviewed_pictures = Picture.joins(:reviews).where(["reviews.user_id = ?", current_user.id])

    # Next get a list of all pictures NOT associated with the user
    other_user_pictures = Picture.all.where.not(user_id: current_user.id)

    # Remove all pictures reviewed by the current user from the list of pictures NOT associated with the user to get a list of unreviewed pictures
    unreviewed_pictures = other_user_pictures - reviewed_pictures

    # Choose a random unreviewed picture to review
    @picture = unreviewed_pictures.shuffle.first
  end

  def user_photos
    @user = User.find(params[:user_id])
    @pictures = Picture.all.where(user_id: params[:user_id])
  end

  def show
    @picture = Picture.find(params[:id])
    @reviews = Review.where(picture_id: @picture.id)
    @thumbs_ups = @reviews.where(rating: 1).count
    @okays = @reviews.where(rating: 0).count
    @thumbs_downs = @reviews.where(rating: -1).count

    @has_comments = false
    @reviews.each do |review|
      if review.comment != ""
        @has_comments = true
        break
      end
    end
  end

  def rate_image
    @review = Review.new
    @review.comment = params[:comment]
    @review.rating = params[:rating]
    @review.picture_id = params[:id]
    @review.user_id = current_user.id
    if @review.save
      RatingMailer.rating_email((Picture.find(@review.picture_id)).user_id).deliver_now
      redirect_to "/review-images"
    else
      @picture = Picture.find(params[:id])
      render "review/review_images"
    end
  end

  def show_rating
    @reviews = Review.all.where(picture_id: @picture.id)
  end

  def rankings
    @pics = Picture.all
    @pics = @pics.sort { |pic1, pic2| get_picture_net_rating(pic2) <=> get_picture_net_rating(pic1) }
  end

  def get_picture_net_rating(picture)
    reviews = Review.where(picture_id: picture.id)
    net = 0
    reviews.each do |review|
      net += review.rating
    end
    net
  end

end
