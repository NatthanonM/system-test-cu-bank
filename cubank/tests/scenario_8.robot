*** Settings ***
Library             SeleniumLibrary
Resource            ../common/commonKeywords.robot
Resource            ../data/environment.robot

Test Setup          Open Register Page
Test Teardown       Close All Browsers
Test Template       Register Success


*** Test Cases ***    AccountID    Password    FirstName    LastName
TC1: Register with normal length 'FirstName LastName'    5012345678    1989    Taylor    Swift
TC11: Register with min 3 length 'FirstName LastName'    5123456789    1989    T    S
TC12: Register with min+ 4 length 'FirstName LastName'    5234567890    1989    T    Ss
TC13: Register with max- 29 length 'FirstName LastName'    5345678901    1989    Tnoerradneleotmiehzi    Sraoteil
TC14: Register with max 30 length 'FirstName LastName'    5456789012    1989    Tulxahasdamistasteno    Soatgotbe
