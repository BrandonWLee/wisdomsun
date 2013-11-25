require 'spec_helper'

describe OtherPage do
  describe 'can create and store information' do
    before :each do
      @category = Category.create(:name => "meep", :refactored_name => "meep")
    end
    it 'can create objects & store the information correctly' do
      @page = OtherPage.create(:title => "Title 1", :refactored_title => "title_1", :category_id => @category.id)
      @page.title == "Title 1"
      @page.refactored_title == "title_1"
      @page.category_id == @category.id
      @page.destroy
    end
    it 'can create and delete pages' do
      @page = OtherPage.create(:title => "Title 1", :refactored_title => "title_1", :category_id => @category.id)
      OtherPage.where(:title => "Title 1") != nil
      @page.destroy
      OtherPage.where(:title => "Title 1") == nil
    end
    after :each do
      @category.destroy
    end
  end
end