class MomentController < ApplicationController

  def index
    @pictures = Picture.all.find_all {|picture| picture.user_id == current_user.id }
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def delete
    @picture = Picture.find(params[:id])
    picture_name = @picture.name
    @picture.destroy
    redirect_to "/mymoments", notice: "#{picture_name} has been deleted!"
  end

end
