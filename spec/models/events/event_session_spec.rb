require 'spec_helper'

describe Events::EventSession do
  
  context "MongoDB" do
    
    before(:each) do
      Event.delete_all
    end
    
    after(:each) do
      Event.delete_all
    end
    
    context "Embedded document" do
      
      it "should add event session in event" do
        
        event = Event.create!(:title => "Biochar conference")
        event_session_1 = event.sessions.build(:title => "Opening")
        event_session_1.save.should be_true
        
        Events::EventSession.all.should_not == [event_session_1] # Because Events::EventSession is an embedded document inside Event
        event.sessions.all.should == [event_session_1]
        
        event_session_2 = event.sessions.build(:title => "Introduction to Biochar")
        
        Events::EventSession.all.should_not == [event_session_1, event_session_2]
        event.sessions.all.should == [event_session_1, event_session_2]        
        
      end
      
    end
    
  end
    
end
