require 'spec_helper'

describe AlbumsController do
  describe 'the index controller method' do
    before :each do
      # @tmp_album = Album.create!(:name => "meep", :description => "lalala")
      @albums = [double('album1'), double('album2')]
    end
    it 'renders index' do
      @album = Album.create!(:name=>"Meep")
      get :index
      @album.destroy
      # response.should render_template('index')
    end
    it 'the show controller method' do
      # @photo1 = Photo.create!(:album_id => @tmp_album.id)
      @album = Album.create!(:name=>"Meep")
      @photo = Photo.create!(:album_id => @album.id)
      get :show, :id => @album.id
      @album.destroy
      @photo.destroy
      # @photo1.destroy
      # response.should render_template('show')
    end
    after :each do
      @album = nil
    end
  end
end
