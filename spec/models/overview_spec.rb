require 'spec_helper'

describe Overview do
  
  # Cleaning is not done with Rspec 2.0.0.beta.22:  
  before(:each) do
    Overview.delete_all
    I18n.locale = "en"
  end
  
  after(:each) do
    Overview.delete_all
    I18n.locale = "en"
  end        
    
  context "Validation" do

    it "should have title" do
      
      # Causes error with Rspec 2.0.0.beta.22: result should have been changed by 0, but was changed by 0
      # expect do
        overview = Overview.create(:title => nil, :locale => "en")
        overview.errors[:title].should_not be_empty
      # end.to change { Overview.count }.by(0)
      
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
      
      Overview.all.should == [overview_english_1, overview_french_1, overview_english_2]
      Overview.in_current_locale == [overview_english_1, overview_english_2]
      
    end
    
    it "should find overview with a keyword" do
      
      overview_english_1 = Overview.create!(:title => "Some title 1", :description => "This is a temp overview", :locale => "en")
      overview_french_1 = Overview.create!(:title => "Quelque titre 1", :description => "C'est bon. temp", :locale => "fr")
      overview_english_2 = Overview.create!(:title => "Some title 2", :description => "This is another overview", :locale => "en")
      overview_english_3 = Overview.create!(:title => "Some temp title 3", :description => "This is yet another overview", :locale => "en")      
      
      Overview.search("temp").should == [overview_english_1, overview_english_3]
      
    end
    
  end
  
end
