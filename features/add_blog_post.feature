Feature: Add blog post
  In order to communicate with members
  As a user
  I want to add a blog post

  Scenario: Add a blog post
    Given I am logged in as "tadatoshi@gmail.com" with password "temppassword"
    When I go to the blog page
    And I follow "Add a new blog post"
    Then I should see "Title"
    And I should see "Content"
    When I fill in the following:
      | Title | First blog post |
      | Content | This is my first post |
    And I press "Create Blog post"
    Then I should see "First blog post"
    And I should see "This is my first post"
    And I should see "tadatoshi@gmail.com" within "h4"
