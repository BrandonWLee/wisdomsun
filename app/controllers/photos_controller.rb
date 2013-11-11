class PhotosController < ApplicationController
  def index
    album_id = params[:album_id]
    album = Album.find_by_id(album_id)
    if (album.nil?) then
      flash[:notice] = "Album does not exist."
      redirect_to albums_path and return
    end
    @photos = Photo.find_pictures_in_album(album_id)
    @album_name = album.name
    @album_desc = album.description
  end
end
