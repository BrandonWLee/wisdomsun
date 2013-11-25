require 'spec_helper'

describe EventsController do
	describe 'the show controller method' do
		before :each do
			@event = double('event')
		end
		it 'should render the show template' do
			Event.stub(:find).and_return(@event)
			post :show, {:id => 1}
			response.should render_template('events/show')
		end
		it 'should pass the correct id param to the find model' do
			Event.should_receive(:find).with(1.to_s).and_return(@event)
			post :show, {:id => 1}
			assigns(:event).should == @event
    end
    it 'should not work for non existent events' do
      Event.should_receive(:find).with(10.to_s).and_raise(ActiveRecord::RecordNotFound)
      post :show, {:id => 10}
      response.should redirect_to(events_path)
		end
	end

	describe 'the index controller method' do
		before :each do
			@events = [double('event1'), double('event2')]
		end
		it 'should render the index template' do
			Event.stub(:all).and_return(@events)
			post :index
			response.should render_template('index')
		end
		it 'should pass the a collection of all books to the view' do
			Event.should_receive(:all).and_return(@events)
			post :index
			assigns(:events). should == @events
		end
	end
end
