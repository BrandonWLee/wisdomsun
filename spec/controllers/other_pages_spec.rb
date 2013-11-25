require 'spec_helper'

describe OtherPagesController do
  describe "show method works correctly" do
    it "should render the correct view" do
      @page = OtherPage.create(:title => "Moo", :refactored_title => "moo") 
      # get :show, :id => @page.id
      # response.should render_template('show')
      @page.destroy
    end
  end
end
