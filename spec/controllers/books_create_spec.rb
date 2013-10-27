require 'spec_helper'  

describe BooksController do
  describe 'controller method for create' do
  	it 'should work when creating' do
  		@fakebook = mock('book')
  		@fakebook.stub(:title).and_return('random')
  		Book.should_receive(:create!).with('random').and_return(@fakebook)
  		post :create, {:book => 'random'}
  		response.should redirect_to(books_path)
  		flash[:notice].should == "random was successfully created."
    end
  end
end