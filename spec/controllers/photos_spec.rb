require 'spec_helper'

describe PhotosController do
  describe 'the index controller method' do
    before :each do
      @photos = [mock('photo1'), mock('photo2')]
      @tmp_album = Album.create!(:name => "meep", :description => "lalala")
    end
    it 'can add pics to albums' do
      @photo = Photo.new(:album_id => @tmp_album.id)
      @photo.destroy
      Photo.find_pictures_in_album(@tmp_album.id) == 0
    end
    it 'renders the index template' do
      Photo.stub(:find_pictures_in_album).and_return(@photos)
      get :index , :album_id => 1
      response.should render_template('index')
    end
    it 'passes the a collection of all photos to the view' do
      Photo.should_receive(:find_pictures_in_album).and_return(@photos)
      get :index
    end
    after :each do
      @tmp_album.destroy
      @photos = nil
    end
  end
end