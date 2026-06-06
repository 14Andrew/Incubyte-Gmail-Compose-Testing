Feature: Gmail Compose Email Functionality

  Background:
    Given the user is logged into Gmail

  Scenario: Send email successfully with valid details
    When the user clicks on Compose
    And enters a valid recipient email address
    And enters subject "Incubyte"
    And enters body "QA test for Incubyte"
    And clicks Send
    Then the email should be sent successfully

  Scenario: Verify sent email appears in Sent folder
    Given an email has been sent successfully
    When the user navigates to the Sent folder
    Then the email should be displayed in the Sent folder

  Scenario: Verify email content after sending
    Given an email exists in the Sent folder
    When the user opens the email
    Then the subject should be "Incubyte"
    And the body should be "QA test for Incubyte"

  Scenario: Send email without recipient
    When the user clicks Compose
    And enters subject "Incubyte"
    And enters body "QA test for Incubyte"
    And clicks Send
    Then a recipient validation message should be displayed

  Scenario: Send email with invalid recipient
    When the user clicks Compose
    And enters recipient "abc123"
    And enters subject "Incubyte"
    And enters body "QA test for Incubyte"
    And clicks Send
    Then an invalid email error message should be displayed

  Scenario: Send email without subject
    When the user clicks Compose
    And enters a valid recipient
    And enters body "QA test for Incubyte"
    And clicks Send
    Then Gmail should prompt for a missing subject

  Scenario: Send email without internet connection
    Given the user has entered valid email details
    And the internet connection is unavailable
    When the user clicks Send
    Then the email should not be sent