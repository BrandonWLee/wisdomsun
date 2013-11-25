require 'spec_helper'

describe AroundTheWebPostsController do
  before :each do
    @posts = [mock('post1'), mock('post2')]
  end
  describe "#index" do
    it 'should render the index template' do
      AroundTheWebPost.stub(:all).and_return(@posts)
      post :index
      response.should render_template('index')
    end
    it 'should pass a collection of all posts to the view' do 
      AroundTheWebPost.should_receive(:all).and_return(@posts)
      post :index
      assigns(:posts).should == @posts
    end
  end
end
