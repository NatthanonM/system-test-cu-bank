*** Settings ***
Library             SeleniumLibrary
Resource            ../common/commonKeywords.robot
Resource            ../data/environment.robot
Resource            ../data/element.robot

Test Setup          Open Login Page
Test Teardown       Close All Browsers
Test Template       Login Failed


*** Test Cases ***    AccountID    Password    ErrorMessage    isValidationMessage    ErrorField
TC17: Login with nonexistent User    5555555555    1234    Not Found User
TC18: Login with min- 9 digits Account Number    501234567    1989    Please fill accountId 10 digits
TC19: Login with max+ 11 digits Account Number    50123456789    1989    Please fill accountId 10 digits
TC20: Login with string Account Number    501234567X    1989    Please put accountId only number
TC21: Login with min- 3 digits Password    5012345678    198    Please fill password 4 digits
TC22: Login with max+ 5 digits Password    5012345678    19890    Please fill password 4 digits
TC23: Login with string Password    5012345678    198X    Please put password only number
TC24: Login with incorrect Password    5012345678    1234    Password Incorrect
TC62: Login with empty Account Number    ${EMPTY}    1234    Please fill out this field.    ${True}    ${LOGIN_ACCOUNT_NUMBER_FIELD}
TC63: Login with empty Password    5012345678    ${EMPTY}    Please fill out this field.    ${True}    ${LOGIN_PASSWORD_FIELD}
