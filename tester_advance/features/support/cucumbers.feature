Feature: Automation test
  As a user,
  I want to sign in,
  So that I verify status login.

  @regression
  Scenario: signup_valid
    Given Sign up successful in the website
    When User in put First name is "Phan", Last name is "Nhan", Job title is "QA/QC", click High School "radio-button-1", click sex is Male "checkbox-1", click exp 0-2 "1" and enter 25-04-1999
    Then When sign up is successful "The form was successfully submitted!" result should be listed on message page

  @regression
  Scenario: login_valid
    Given login successful in the website
    When user input valid user is "tomsmith" 
    And valid password is "SuperSecretPassword"
    Then when login is successful "You logged into a secure area!" result should be listed on message page

  #@in-progress
  @regression
  Scenario Outline: login_invalid
    Given login successful in the website
    When user input invalid user is '<username>' 
    And invalid password is '<password>'
    Then when login is failed "Your username is invalid!" result should be listed on message page

    Examples:
            | username   | password            |
            | tomsmith   | abcdef              |
            | flashzer   | SuperSecretPassword |


  
