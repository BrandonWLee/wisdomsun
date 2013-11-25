require 'spec_helper'

describe CategoriesController do
  describe 'the index controller method' do
    before :each do
      @category = Category.create(:name => "meep", :refactored_name => "meep")
      @category2 = Category.create(:name => "meep2", :refactored_name => "meep2")
    end
    it 'renders index correctly' do
      get :index
      response.should render_template('index')
    end
    it 'the show controller method' do
      get :show, :id => 1
      # @photo1.destroy
      response.should render_template('show')
    end
    it 'can access pages thru getpage' do
      @page = OtherPage.create(:title => "bloop", :refactored_title => "bloop1", :category_id => 1)
      get :getpage, :category_name => "meep", :page_name => "bloop"
    end
    after :each do
      @category.destroy
      @category1.destroy
    end
  end
end