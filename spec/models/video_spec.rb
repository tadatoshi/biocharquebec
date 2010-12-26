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
    
    context "Scope" do
      
      before(:each) do
        I18n.locale = "en"
      end      
      
      after(:each) do
        I18n.locale = "en"
      end      

      it "should have the current locale and be ordered by id" do     

        video_1 = Video.create!(:thumbnail_file_path => "http://temp.ca/image.jpg", :video_file_path => "http://temp.ca/video", :title => "Temp video")
        video_2 = Video.create!(:thumbnail_file_path => "http://temp.ca/image.jpg", :video_file_path => "http://temp.ca/video", :title => "Temp video")
        video_3 = Video.create!(:thumbnail_file_path => "http://temp.ca/image.jpg", :video_file_path => "http://temp.ca/video", :title => "Temp video")
        video_4 = Video.create!(:thumbnail_file_path => "http://temp.ca/image.jpg", :video_file_path => "http://temp.ca/video", :title => "Temp video")

        Video.ordered.map { |video| video }.should == [video_1, video_2, video_3, video_4]

      end

    end    
    
    context "Search" do
      
      it "should find one with a keyword" do
        
        Video.should search_by(:title)
        
      end
      
    end    

  end

end
