require 'spec_helper'
describe CategoriesController do
  describe 'the index controller method' do
    it "should render the right view" do
      @category = Category.create(:name => "Meep", :refactored_name => "meep")
      get :index
      response.should render_template('index')
      @category.destroy
    end
  end
  describe 'the show controller method' do
    it "should not render show when there are no pages" do
      @category = Category.create!(:name => "Meep2", :refactored_name => "meep2", :position => 1)
      get :show, :id => @category.id
      response.should render_template('')
      @category.destroy
    end
    it "should render show when there are pages" do
      @category = Category.create(:name => "Meep3", :refactored_name => "meep3", :position =>1)
      @page = OtherPage.create(:title => "Bloop", :refactored_title => "bloop", :category_id => @category.id)
      get :show, :id => @category.id
      response.should render_template('show')
      @category.destroy    
      @page.destroy
    end
  end
  describe 'the getpage function gets the correct page' do
    it "should render the right view" do
      @category = Category.create(:name => "Meep3", :refactored_name => "meep3", :position =>1)
      @page = OtherPage.create(:title => "Bloop", :refactored_title => "bloop", :category_id => @category.id)
      get :getpage, :category_name => @category.name, :page_name => @page.title
      # response.should render_template('')
      @category.destroy    
      @page.destroy
    end
  end
end
