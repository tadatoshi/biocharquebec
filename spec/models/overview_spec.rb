require 'spec_helper'

describe Overview do
    
  before(:each) do
    I18n.locale = "en"
  end
  
  after(:each) do
    I18n.locale = "en"
  end        
    
  context "Validation" do

    it "should have title" do
      
      expect do
        overview = Overview.create(:title => nil, :locale => "en")
        overview.errors[:title].should_not be_empty
      end.to change { Overview.count }.by(0)
      
    end
    
    it "should have locale automatically assigned if not assigned" do
       
      expect do
        overview = Overview.create(:title => "Some title", :locale => nil)
        overview.errors[:locale].should be_empty
        overview.locale.should == "en"
      end.to change { Overview.count }.by(1)      
      
    end
    
  end
  
  context "Scope" do
    
    it "should get all for the current locale" do
      
      overview_english_1 = Overview.create!(:title => "Some title 1", :locale => "en")
      overview_french_1 = Overview.create!(:title => "Quelque titre 1", :locale => "fr")
      overview_english_2 = Overview.create!(:title => "Some title 2", :locale => "en")
      
      I18n.locale = "en"
      
      Overview.all.should == [overview_english_1, overview_french_1, overview_english_2]
      Overview.in_current_locale.all == [overview_english_1, overview_english_2]
      
    end
    
  end
  
end
