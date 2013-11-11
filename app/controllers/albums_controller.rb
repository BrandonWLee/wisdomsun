class AlbumsController < ApplicationController
  def index
    @albums = Album.all
  end
  def show
    redirect_to photos_path, :album_id => params[:id]
  end
end
