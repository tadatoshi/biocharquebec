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

  end

end
