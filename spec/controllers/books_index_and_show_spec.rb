require 'spec_helper'

describe BooksController do
	describe 'the show controller method' do
		before :each do
			@book = mock('book')
      Book.stub(:exists?).and_return(true)
		end
		it 'should render the show template' do
			Book.stub(:find).and_return(@book)
			get :show, {:id => 1}
			response.should render_template('books/show')
		end
		it 'should pass the correct id param to the find model' do
			Book.should_receive(:find).with(1.to_s).and_return(@book)
			get :show, {:id => 1}
			assigns(:book).should == @book
		end
	end

	describe 'the index controller method' do
		before :each do
			@books = [mock('book1'), mock('book2')]
		end
		it 'should render the index template' do
			Book.stub(:all).and_return(@books)
			get :index
			response.should render_template('index')
		end
		it 'should pass the a collection of all books to the view' do
			Book.should_receive(:all).and_return(@books)
			get :index
			assigns(:books). should == @books
		end
	end
end
