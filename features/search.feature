Feature: Search
  In order to find information quickly
  User
  wants to search

  Background:
    Given the following overview records
      | title         | description                                           | locale |
      | About biochar | The pyrolysis of biomass feedstocks produces biochar. | en     |
    And the following blog_post records
      | title       | content                 | locale |
      | First post  | This is a blog post.    | en     |
      | Second post | This is the second post | en     |

  Scenario: Search contents with the specified word
    Given I am on the homepage
    When I fill in "biochar" for "query"
    And I press "Search"
    Then I should see "The pyrolysis of biomass feedstocks produces biochar."

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
  # Scenario: Delete search
  #   Given the following searches:
  #     ||
  #     ||
  #     ||
  #     ||
  #     ||
  #   When I delete the 3rd search
  #   Then I should see the following searches:
  #     ||
  #     ||
  #     ||
  #     ||
