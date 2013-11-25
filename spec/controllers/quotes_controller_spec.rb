require 'spec_helper'

describe QuotesController do
  before :each do
    @quotes = [mock('quote1'), mock('quote2')]
  end
  describe "#index" do
    it 'should render the index template' do
      Quote.stub(:all).and_return(@quotes)
      post :index
      response.should render_template('index')
    end
    it 'should pass a collection of all quotes to the view' do 
      Quote.should_receive(:all).and_return(@quotes)
      post :index
      assigns(:quotes).should == @quotes
    end
  end

end
