Feature: Add blog post comment
  In order to give a feedback to a blog post
  As a signed-up user
  I want to add a comment

  Background:
    Given the following blog_post records
      | title       | content                 | locale |
      | First post  | This is the first post  | en     |
      | Second post | This is the second post | en     |

  Scenario: Add the first comment
    Given I am logged in as tadatoshi@gmail.com with password temppassword
    When I go to the blog page
    Then I should see "First post"
    And I should see "This is the first post"  
    And I should see "Second post"
    And I should see "This is the second post"
    And I should see "Comments"
    When I follow "Comments"
    Then I should see "Add a comment"
    And I should see "Add"
    When I fill in "I like this post." for "blogs_comment_content"
    And I press "Add"
    Then I should see "I like this post."
    When I follow "Back"
    Then I should see "First post"
    And I should see "This is the first post"  
    And I should see "Second post"
    And I should see "This is the second post"
    And I should see "Comments"