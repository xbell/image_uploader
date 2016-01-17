class MomentController < ApplicationController

  def index
    @pictures = Picture.all.where(user_id: current_user.id)
  end

  def show
    @picture = Picture.find(params[:id])
    @reviews = Review.where(picture_id: @picture.id)
    @thumbs_ups = @reviews.where(rating: 1).count
    @okays = @reviews.where(rating: 0).count
    @thumbs_downs = @reviews.where(rating: -1).count
  end

  def delete
    @picture = Picture.find(params[:id])
    picture_name = @picture.name
    @picture.destroy
    redirect_to "/mymoments", notice: "#{picture_name} has been deleted!"
  end

end
