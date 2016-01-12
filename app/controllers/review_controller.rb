class ReviewController < ApplicationController


  def review_images
    # @pictures = Picture.all.find_all {|picture| picture.user_id != current_user.id }
    @picture = Picture.all.order("RANDOM()").where.not(user_id: current_user.id).first
  end

  def user_photos
    @pictures = Picture.all.where(user_id: params[:user_id])
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def rate_image
    @review = Review.new
    @review.comment = params[:comment]
    @review.rating = params[:rating]
    @review.picture_id = params[:id]
    @review.user_id = current_user.id
    if @review.save
      redirect_to "/review-images"
    else
      @review.destroy
      render "review/review_images"
    end
  end

end
