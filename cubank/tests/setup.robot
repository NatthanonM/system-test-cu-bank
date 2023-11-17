*** Settings ***
Library             SeleniumLibrary
Resource            ../common/commonKeywords.robot
Resource            ../data/environment.robot

Test Setup          Open Register Page
Test Teardown       Close All Browsers
Test Template       Register Success


*** Test Cases ***    AccountID    Password    FirstName    LastName
Account1    5678901234    1989    T    S
Account2    1234567890    1234    T    S
Account3    2345678901    1234    T    S
Account4    4567890123    1234    T    S
Account5    7000000000    1234    John    Doe
Account6    6000000000    1234    John    Doe
