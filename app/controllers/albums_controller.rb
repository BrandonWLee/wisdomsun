class AlbumsController < ApplicationController
  def index
    @albums = Album.all
  end
  def show
    redirect_to photos_page, :album_id => param[:id]
  end
end
