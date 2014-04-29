class VideosController < ApplicationController

  def index
    @videos = Video.all
  end

  def new

  end

  def create
    @video = Video.new
    @video.url = params[:url]
    @video.description = params[:description]
    @video.rating = params[:rating]
    @video.save
    redirect_to "/videos/#{@video.id}"
  end

  def show
    @video = Video.find(params[:id])
  end
end

