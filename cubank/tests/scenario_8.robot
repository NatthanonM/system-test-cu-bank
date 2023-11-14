*** Settings ***
Library             SeleniumLibrary
Resource            ../common/commonKeywords.robot
Resource            ../data/environment.robot

Test Setup          Open Register Page
Test Teardown       Close All Browsers
Test Template       Register Success


*** Test Cases ***    AccountID    Password    FirstName    LastName
TC1    5012345678    1989    Taylor    Swift
TC11    5123456789    1989    T    S
TC12    5234567890    1989    Tounubhu    Sosaelf
TC13    5345678901    1989    Tnoerradneleotmiehzi    Sraoteil
TC14    5456789012    1989    Tulxahasdamistasteno    Soatgotbe
