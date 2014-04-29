class PicturesController < ApplicationController
  def index

  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new
    @picture.url = params[:picture][:url]
    @picture.description = params[:picture][:description]
    @picture.rating = params[:picture][:rating]
    @picture.save



    p @picture

    id = @picture.id
    puts ">>>>>>"
    p id
    redirect_to "/pictures/#{id}"
  end

  def show
    p "....."
    p params[:id]
    id = params[:id]
    puts ">>>>>>"
    puts id
    @picture = Picture.find(id)

  end

end