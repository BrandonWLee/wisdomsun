require "spec_helper"
describe Category do
  describe 'can create and store information' do
    it 'can create objects & store the information correctly' do
      @category = Category.create(:name => "Name 1", :refactored_name => "name_1", :position => 1)
      @category.name = "Name 1"
      @category.refactored_name = "name_1"
      @category.position = 1
      @category.destroy
    end
    it 'can create and delete pages' do
      @category = Category.create(:name => "Name 1", :refactored_name => "name_1", :position => 1)
      Category.where(:title => "Name 1") != nil
      @category.destroy
      Category.where(:title => "Name 1") == nil
    end
  end
end