class AddpicController < ApplicationController

  def index

  end

  def addpic
    @user = User.find(params[:id])
    @picture = Picture.new
    @picture.name = params[:name]
    @picture.description = params[:description]
    @picture.user_id = @user.id
    @picture.url = params[:url]
    if @picture.save
      redirect_to "/mymoments/#{@user.id}", notice: "#{@picture.name} has been added to your captured moments!"
    else
      @picture.destroy
      flash.now[:notice] = "Error adding photo, make sure to fill in all fields."
      render :addpic
    end
  end

  def addpic_params
    params.require(:picture).permit(:name, :description, :url)
  end

end
