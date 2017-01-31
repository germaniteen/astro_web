Feature:  Test the performance and loading time of homepage

  Scenario: Verify page loads within 0.1 second
    Given I visit the HomePage
    Then the page loads within 0.1 second

  Scenario: Verify page loads within 5 seconds
    Given I visit the HomePage
    When I skip the ad page
    Then the page loads within 5 seconds

  Scenario: Verify page loads successfully
    Given I visit the HomePage
    When I skip the ad page
    Then the page loads successfully

  Scenario: Ensure none of the links within this page results in a non 200 header response
    Given I visit the HomePage
    When I skip the ad page
    Then the page loads successfully
    When I get all links on home page
    Then all links returns 200 HTTPOK

    Scenario: Verify 'Auto-Debit Campaign' is not more than the third campaign
      Given I visit the HomePage
      When I skip the ad page
      Then the page loads successfully
      When I get the index of Auto-debit campain on home page
      Then Auto-Debit campaign should not more than the third

  Scenario: Verify 'Auto-Debit Campaign' is not the last in the campaign
    Given I visit the HomePage
    When I skip the ad page
    Then the page loads successfully
    When I have number of available campaigns
    And I get the index of Auto-debit campain on home page
    Then Auto-Debit campaign should not in the last number of available campaigns
    When I click the Auto-Debit campaign
    And I click register button on auto debit page
    And I register new user on the register page
    Then new user is registered successfully on the register page
