class AlbumsController < ApplicationController
  def index
    @albums = Album.all
    # @album_names = []
    # @album_covers = []
    # @album_desc = []
    # albums.each do |album|
      # @album_desc << album.description
      # @album_covers << album.album_cover.url
      # @album_names << album.name
    # end
  end
  def show
    redirect_to photos_page, :album_id => param[:id]
  end
end
