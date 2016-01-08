class AddpicController < ApplicationController

  def index

  end

  def addpic
    @picture = Picture.new
    @picture.name = params[:name]
    @picture.description = params[:description]
    @picture.user_id = current_user.id
    @picture.url = params[:url]
    if @picture.save
      redirect_to "/mymoments", notice: "#{@picture.name} has been added to your captured moments!"
    else
      @picture.destroy
      flash.now[:notice] = "Error adding photo, make sure to fill in all fields."
      render :addpic
    end
  end


  private

    def addpic_params
      params.require(:picture).permit(:name, :description, :url)
    end

end