class MomentController < ApplicationController

  def index
    @pictures = Picture.all
  end

end
