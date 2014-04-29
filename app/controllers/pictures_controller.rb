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
    id = @picture.id
    redirect_to "/pictures/#{id}"
  end

  def show
    id = params[:id]
    @picture = Picture.find(id)
  end
end