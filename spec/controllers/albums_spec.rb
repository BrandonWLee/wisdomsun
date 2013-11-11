require 'spec_helper'
describe AlbumsController do
  describe 'the index controller method' do
    before :each do
      @tmp_album = Album.create!(:name => "meep", :description => "lalala")
    end
    describe 'the index controller method' do
      get :index
      response.should render_template('index')
    end
    describe 'the show controller method' do
      get :show
      response.should render_template('show')
    end
    after :each do
      @tmp_album.destroy
    end
  end
end