Feature: Manage admins
  In order to allow only invited admins to manage data for certain content
  admin
  wants to send an invitation e-mail to a specified person
  
  Scenario: Register new admin
    Given I am on the new admin page
    When I fill in the following:
      | User name             | admin                   |
      | First name            | Bio                     |
      | Last name             | Char                    |
      | Email                 | admin@biocharquebec.org |
      | Password              | secret                  |
      | Password confirmation | secret                  |
    And I press "Sign up"
    Then I should see "You have signed up successfully."

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
  Scenario: Delete admin
    # Given the following admins:
    #   ||
    #   ||
    #   ||
    #   ||
    #   ||
    # TODO: Route to index is not generated by Devise. Find out admin users management.
    # When I delete the 3rd admin
    # Then I should see the following admins:
    #   ||
    #   ||
    #   ||
    #   ||
