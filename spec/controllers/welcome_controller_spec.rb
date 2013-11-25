require 'spec_helper'

describe WelcomeController do
	describe 'the Welcome Controller' do
		it "should set events variable to a list of events" do
			@events1 = [double('event1'), double('event2'), double('event3')]
			Event.should_receive(:all).and_return(@events1)
			post :index
			response.should render_template('welcome/index')
			assigns(:events).should == @events1
		end
	end
end
