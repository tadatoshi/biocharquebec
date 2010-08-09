Feature: Manage overviews
  In order to display general information
  administrator
  wants to add an overview

  Scenario: Normal user cannot add an overview
    Given I am on the overviews page
    Then I should not see "Add an overview"

  Scenario: Signed in user cannot add an overview
    Given I am logged in as "tadatoshi@gmail.com" with password "temppassword"
    When I go to the overviews page
    Then I should not see "Add an overview"

  Scenario: Administrator can add an overview
    Given I am an administrator logged in as "admin@biocharquebec.org" with password "secret"
    When I go to the overviews page
    Then I should see "Add"
    When I follow "Add"
    Then I should see "Title"
    And I should see "Description"
    When I fill in "About us" for "Title"
    And I fill in "Biochar Quebec is a group of people interested in biochar." for "Description"
    And I press "Create Overview"
    Then I should see "About us"
    And I should see "Biochar Quebec is a group of people interested in biochar."

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
#  Scenario: Delete overview
#    Given the following overviews:
#      ||
#      ||
#      ||
#      ||
#      ||
#    When I delete the 3rd overview
#    Then I should see the following overviews:
#      ||
#      ||
#      ||
#      ||
