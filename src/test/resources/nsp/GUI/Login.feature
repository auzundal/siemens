@login-feature
Feature: Login

  @login-feature-ldap-successful
  Scenario: User login successful
    Given Merchant is on the Login Page
    When Merchant login with "58468553958" username, "Ayhan7496" password
  #  Then Merchant should see username as "Sprint-100" on Home Page

 # @login-feature-ldap-unsuccessful
 # Scenario: User login failed
 #   Given Merchant is on the Login Page
 #   When Merchant login with "Sprint-100" username, "Test12345!" password
 #   Then Merchant should see Access Denied Message
#
