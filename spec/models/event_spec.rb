require 'spec_helper'

describe Event do
  
  context "MongoDB" do
    
    before(:each) do
      Event.delete_all
    end
    
    after(:each) do
      Event.delete_all
    end    
    
    context "Validation" do
      
      before(:each) do
        I18n.locale = "en"
      end      
      
      after(:each) do
        I18n.locale = "en"
      end 
      
      it "should have title" do
        
        # Causes error with Rspec 2.0.0.beta.22: result should have been changed by 0, but was changed by 0
        # expect do
          event = Event.create(:title => nil, :locale => "en")
          event.errors[:title].should_not be_empty
        # end.to change { Event.count }.by(0)
        
        expect do
          event = Event.create(:title => "Some title", :locale => "en")
          event.errors[:title].should be_empty
        end.to change { Event.count }.by(1)        
        
      end
      
      it "should have locale automatically assigned if not assigned" do
      
        expect do
          event = Event.create(:title => "Some title", :locale => nil)
          event.errors[:locale].should be_empty
          event.locale.should == "en"
        end.to change { Event.count }.by(1)
      
      end      
      
    end
    
  end

end