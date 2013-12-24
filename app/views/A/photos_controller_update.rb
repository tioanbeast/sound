# app/controllers/photos_controller.rb

class PhotosController < ApplicationController
  
  # ...
  
  def serve
    @photo = Photo.find(params[:id])
    send_data(@photo.data, :type => @photo.mime_type, :filename => "#{@photo.name}.jpg", :disposition => "inline")
  end

end