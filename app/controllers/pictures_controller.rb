class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(url: params[:picture][:url], description: params[:picture][:description], rating: params[:picture][:rating])
    if @picture.save
      id = @picture.id
      redirect_to "/pictures/#{id}", :flash => { :success => "Picture Successfully Created!" }
    else
      render '/pictures/new'
    end
  end

  def show
    id = params[:id]
    @picture = Picture.find(id)
  end

  def strong_params

  end
end
