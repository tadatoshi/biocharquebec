Feature: Manage videos
  In order to learn the sessions of conference
  user
  wants to view videos
  
  Scenario: View the list of videos
    Given I am on the videos page
    Then I should see "Videos"

  Scenario: Add a new video data
    Given I am an administrator logged in as "admin@biocharquebec.org" with password "secret"
    When I go to the new video page
    And I fill in "http://temp.ca/clip-2010-09-03-15-28-02.jpg" for "Thumbnail file path"
    And I fill in "http://picasaweb.google.com/lh/photo/sometemp?feat=embedwebsite" for "Video file path"
    And I fill in "Tadatoshi test" for "Title"
    And I press "Create Video"
    Then I should see "http://temp.ca/clip-2010-09-03-15-28-02.jpg"
    And I should see "http://picasaweb.google.com/lh/photo/sometemp?feat=embedwebsite"
    And I should see "Tadatoshi test"

  # Rails generates Delete links that use Javascript to pop up a confirmation
  # dialog and then do a HTTP POST request (emulated DELETE request).
  #
  # Capybara must use Culerity/Celerity or Selenium2 (webdriver) when pages rely
  # on Javascript events. Only Culerity/Celerity supports clicking on confirmation
  # dialogs.
  #
  # Since Culerity/Celerity and Selenium2 has some overhead, Cucumber-Rails will
  # detect the presence of Javascript behind Delete links and issue a DELETE request 
  # instead of a GET request.
  #
  # You can turn this emulation off by tagging your scenario with @no-js-emulation.
  # Turning on browser testing with @selenium, @culerity, @celerity or @javascript
  # will also turn off the emulation. (See the Capybara documentation for 
  # details about those tags). If any of the browser tags are present, Cucumber-Rails
  # will also turn off transactions and clean the database with DatabaseCleaner 
  # after the scenario has finished. This is to prevent data from leaking into 
  # the next scenario.
  #
  # Another way to avoid Cucumber-Rails' javascript emulation without using any
  # of the tags above is to modify your views to use <button> instead. You can
  # see how in http://github.com/jnicklas/capybara/issues#issue/12
  #
#  Scenario: Delete video
#    Given the following videos:
#      ||
#      ||
#      ||
#      ||
#      ||
#    When I delete the 3rd video
#    Then I should see the following videos:
#      ||
#      ||
#      ||
#      ||
