require 'spec_helper'

describe ReferenceFile do

  context "MongoDB" do

    before(:each) do
      ReferenceFile.delete_all
    end

    after(:each) do
      ReferenceFile.delete_all
    end

    it "should create a ReferenceFile with title in addition to file upload" do

      reference_file = ReferenceFile.create!(:title => "Temp file")

      reference_file.title.should == "Temp file"

    end
    
    context "Scope" do
      
      before(:each) do
        I18n.locale = "en"
      end      
      
      after(:each) do
        I18n.locale = "en"
      end      

      it "should have the current locale and be ordered by id" do     

        reference_file_1 = ReferenceFile.create!(:title => "Temp file")
        reference_file_2 = ReferenceFile.create!(:title => "Temp file")
        reference_file_3 = ReferenceFile.create!(:title => "Temp file")
        reference_file_4 = ReferenceFile.create!(:title => "Temp file")
        reference_file_5 = ReferenceFile.create!(:title => "Temp file")

        ReferenceFile.ordered.map { |reference_file| reference_file }.should == [reference_file_1, reference_file_2, reference_file_3, reference_file_4, reference_file_5]

      end

    end 
    
    context "Search" do
      
      it "should find one with a keyword" do
        
        ReferenceFile.should search_by(:title)
        
      end
      
    end       

  end

end
