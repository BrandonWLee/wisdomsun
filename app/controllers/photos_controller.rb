class PhotosController < ApplicationController
  def index
    album_id = params[:album_id]
    album = Album.find_by_id(album_id).name
    @photos = Photo.find_pictures_in_album(album_id)
    @album_name = album.name
    @album_desc = album.description
  end
  def show
    @photos = Photo.find_by_id(params[:photo_id]).picture # pass in the photo id from the click
    @photo_desc = @photos.description
  end
end
