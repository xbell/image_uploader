class ReviewController < ApplicationController


  def review_images
    # @pictures = Picture.all.find_all {|picture| picture.user_id != current_user.id }
    @picture = Picture.all.order("RANDOM()").where.not(user_id: current_user.id).first
  end


end
