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

  def edit
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])
    @video.url = params[:url]
    @video.description = params[:description]
    @video.rating = params[:rating]
    if @video.save
      redirect_to "/videos/#{@video.id}", :flash => { :success => "Video Successfully Updated!" }
    else
      render :edit
    end
  end

  def destroy
    Video.find(params[:id]).destroy
    redirect_to videos_path, :flash => { :success => "Video Successfully Deleted!" }
  end
end

