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
    if @video.save
      redirect_to "/videos/#{@video.id}", :flash => { :success => "Video Successfully Created!" }
    else
      render "/videos/new"
    end
  end

  def show
    @video = Video.find(params[:id])
    url = URI(@video.url).query
    params = CGI::parse(url)
    @video_query = params["v"].first
  end
end

