*** Settings ***
Library             SeleniumLibrary
Resource            ../common/commonKeywords.robot
Resource            ../data/environment.robot
Resource            ../data/element.robot

Test Setup          Open Login Page
Test Teardown       Close All Browsers
Test Template       Login Failed


*** Test Cases ***    AccountID    Password    ErrorMessage    isValidationMessage    ErrorField
S2.1: TC17 (Login failed with nonexistent User)    5555555555    1234    Not Found User
S2.2: TC18 (Login failed with min- 9 digits Account Number)    501234567    1989    Please fill accountId 10 digits
S2.3: TC19 (Login failed with max+ 11 digits Account Number)    50123456789    1989    Please fill accountId 10 digits
S2.4: TC20 (Login failed with string Account Number)    501234567X    1989    Please put accountId only number
S2.5: TC21 (Login failed with min- 3 digits Password)    5012345678    198    Please fill password 4 digits
S2.6: TC22 (Login failed with max+ 5 digits Password)    5012345678    19890    Please fill password 4 digits
S2.7: TC23 (Login failed with string Password)    5012345678    198X    Please put password only number
S2.8: TC24 (Login failed with incorrect Password)    5678901234    1234    Password Incorrect
S2.9: TC25 (Login failed with empty Account Number)    ${EMPTY}    1234    Please fill out this field.    ${True}    ${LOGIN_ACCOUNT_NUMBER_FIELD}
S2.10: TC26 (Login failed with empty Password)    5012345678    ${EMPTY}    Please fill out this field.    ${True}    ${LOGIN_PASSWORD_FIELD}
