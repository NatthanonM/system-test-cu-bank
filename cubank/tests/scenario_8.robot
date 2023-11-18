*** Settings ***
Library             SeleniumLibrary
Resource            ../common/commonKeywords.robot
Resource            ../data/environment.robot

Test Setup          Open Register Page
Test Teardown       Close All Browsers
Test Template       Register Success


*** Test Cases ***    AccountID    Password    FirstName    LastName
S8.1: TC1 (Register success with normal length 'FirstName LastName')    5012345678    1989    Taylor    Swift
S8.2: TC11 (Register success with min 3 length 'FirstName LastName')    5123456789    1989    T    S
S8.3: TC12 (Register success with min+ 4 length 'FirstName LastName')    5234567890    1989    T    Ss
S8.4: TC13 (Register success with max- 29 length 'FirstName LastName')    5345678901    1989    Tnoerradneleotmiehzi    Sraoteil
S8.5: TC14 (Register success with max 30 length 'FirstName LastName')    5456789012    1989    Tulxahasdamistasteno    Soatgotbe
