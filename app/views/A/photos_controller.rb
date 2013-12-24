# app/controllers/photos_controller.rb

class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])
  end
  
  def new
    @photo = Photo.new
  end

  def create
    
    # build a photo and pass it into a block to set other attributes
    @photo = Photo.new(params[:photo]) do |t|
      if params[:photo][:data]
        t.data      = params[:photo][:data].read
        t.filename  = params[:photo][:data].original_filename
        t.mime_type = params[:photo][:data].content_type
      end
    end
    
    # normal save
    if @photo.save
      redirect_to(@photo, :notice => 'Photo was successfully created.')
    else
      render :action => "new"
    end
  end
  
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to(photos_url)
  end
end