require 'spec_helper'

describe BooksController do
	it 'should have a working destroy method' do
  	    @fakebook = double('book')
  		@fakebook.should_receive(:title).and_return('random')
  		@fakebook.stub(:destroy).and_return('random')
  		Book.stub(:find).and_return(@fakebook)
  		post :destroy, {:id => 'random'}
  		response.should redirect_to(books_path)
  		flash[:notice].should == "Book 'random' deleted."
    end
end
