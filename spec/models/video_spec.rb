require 'spec_helper'

describe Video do
  
  context "MongoDB" do

    before(:each) do
      Video.delete_all
    end

    after(:each) do
      Video.delete_all
    end

    it "should create a video" do

      video = Video.create!(:thumbnail_file_path => "http://temp.ca/image.jpg", :video_file_path => "http://temp.ca/video", :title => "Temp video")

      video.thumbnail_file_path.should == "http://temp.ca/image.jpg"
      video.video_file_path.should == "http://temp.ca/video"
      video.title.should == "Temp video"

    end

  end

end
