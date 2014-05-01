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

  def edit
    id = params[:id]
    @picture = Picture.find(id)
  end

  def update
    id = params[:id]
    @picture = Picture.find(id)
      if @picture.update(url: params[:picture][:url], description: params[:picture][:description], rating: params[:picture][:rating])
      redirect_to "/pictures/#{id}", :flash => { :success => "Picture Successfully Updated!" }
    else
      render :edit
    end
  end

  def destroy
    id = params[:id]
    @picture = Picture.find(id)
    @picture.destroy
    redirect_to pictures_path, :flash => { :success => "Picture Successfully Deleted!" }
  end

end
