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

    session[:id] = @video.id
    redirect_to "/videos/#{@video.id}"
  end

  def show
    if session[:id]
      @message = "Video successfully created"
    end
    @video = Video.find(params[:id])
    url = URI(@video.url).query
    params = CGI::parse(url)
    @video_query = params["v"].first
    session.clear
  end
end

