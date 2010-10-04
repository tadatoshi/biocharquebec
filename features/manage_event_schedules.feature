Feature: Manage event_schedules
  In order to display event schedule with links to relevant references such as videos or presentations
  Administrator
  wants add an event

  Before do
    Admin.delete_all
    Event.delete_all
    DatabaseCleaner.start
  end

  After do
    DatabaseCleaner.clean
    Admin.delete_all
    Event.delete_all
  end

  Scenario: Register new event
    Given I am an administrator logged in as "admin@biocharquebec.org" with user name "my user name" and password "secret"
    And I am on the new event page
    When I fill in "Conference for biochar" for "Title"
    # And I select "2010-09-02" as the "Date" date
    And I fill in "2010-09-02" for "Date"
    And I fill in "Centre communautaire, rue du Parc, St-François-Xavier-de-Brompton, Quebec" for "Location"
    And I fill in "The research and applications updates in Biochar in Canada" for "Description"
    And I press "Add Event"
    Then I should see "Conference for biochar"
    And I should see "2010-09-02"
    And I should see "Centre communautaire, rue du Parc, St-François-Xavier-de-Brompton, Quebec" 
    And I should see "The research and applications updates in Biochar in Canada" 
    When I follow "Event schedule"
    And I follow "Add a session"
    And I fill in "9:00" for "Start time"
    And I fill in "9:20" for "End time"
    And I fill in "Introduction of the science and technology of biochar" for "Title"
    And I fill in "Julie Major, PhD" for "Presenter"
    And I fill in "International Biochar Initiative" for "Affiliation"
    And I press "Create Event session"
    Then I should see "Conference for biochar"
    And I should see "The research and applications updates in Biochar in Canada"
    And I should see "2010-09-02"
    And I should see "Centre communautaire, rue du Parc, St-François-Xavier-de-Brompton, Quebec"  
    And I should see "09:00-09:20"
    And I should see "Julie Major, PhD"
    And I should see "International Biochar Initiative"
    And I should see "Introduction of the science and technology of biochar"