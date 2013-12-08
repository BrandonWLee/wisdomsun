require "spec_helper"
describe Event do
  describe 'can list Elements' do
    it 'by creation time' do
      @event1 = Event.create(:name => "blah1")
      @event2 = Event.create(:name => "blah2")
      @event3 = Event.create(:name => "blah3")
      list = [@event3, @event2, @event1]
      Event.mostRecent(5).should == list
      @event1.destroy
      @event2.destroy
      @event3.destroy
    end
    it 'should be able to restrict by size' do
      @event1 = Event.create(:name => "blah1")
      @event2 = Event.create(:name => "blah2")
      @event3 = Event.create(:name => "blah3")
      @event4 = Event.create(:name => "blah4")
      @event5 = Event.create(:name => "blah5")
      @event6 = Event.create(:name => "blah6")
      list = [@event6, @event5, @event4, @event3, @event2]
      Event.mostRecent(5).should == list
      @event1.destroy
      @event2.destroy
      @event3.destroy
      @event4.destroy
      @event5.destroy
      @event6.destroy
    end
  end
end