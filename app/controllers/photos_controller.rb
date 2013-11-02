class PhotosController < ApplicationController
  def index
    album_id = params[:album_id]
    @photos = Photo.find_by_album_id(album_id)
    @album_name = Album.find_by_id(album_id).name
  end
  def show
  end
end
