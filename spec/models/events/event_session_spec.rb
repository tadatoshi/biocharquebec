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
    
    context "Association" do
      
      it "should be associated with a video" do
        
        event = Event.create!(:title => "Biochar conference")
        event_session_1 = event.sessions.create!(:title => "Opening")
        
        video_1 = Video.create!(:thumbnail_file_path => "http://temp.ca/image.jpg", :video_file_path => "http://temp.ca/video", :title => "Temp video")
        
        event_session_1.video = video_1
        event_session_1.save.should be_true
        
        event_session_1.video.should == video_1
        video_1.event_session.should == event_session_1
        
      end
      
      it "should be associated with a reference_file" do
        
        event = Event.create!(:title => "Biochar conference")
        event_session_1 = event.sessions.create!(:title => "Opening")
        
        reference_file_1 = ReferenceFile.create!(:title => "Temp file")
        
        event_session_1.reference_file = reference_file_1
        event_session_1.save.should be_true
        
        event_session_1.reference_file.should == reference_file_1
        reference_file_1.event_session.should == event_session_1
        
      end      
      
    end
    
  end
    
end
