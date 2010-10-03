module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'
    when /the new event_schedule page/
      new_event_schedule_path
    when /the new event page/
      new_event_path
    when /the new user page/
      new_user_registration_path
    when /the videos page/
      videos_path
    when /the new video page/
      new_video_path  
    when /the new reference_file page/
      new_reference_file_path
    when /the new overview page/
      new_overview_path
    when /the overviews page/
      overviews_path
    when /the new admin page/
      new_admin_registration_path
    when /the new search page/
      new_search_path
    when /the blog page/
      blog_posts_url
    when /the new invitation page/
      new_admin_invitation_path      

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
