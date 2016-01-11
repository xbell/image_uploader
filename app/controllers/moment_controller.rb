class MomentController < ApplicationController

  def index
    @pictures = Picture.all.find_all {|picture| picture.user_id == current_user.id }
  end

  def show
    @picture = Picture.find(params[:id])
  end

end
