*** Settings ***
Library             SeleniumLibrary
Resource            ../common/commonKeywords.robot
Resource            ../data/environment.robot

Test Teardown       Close All Browsers


*** Test Cases ***
TC2: Register with min-, max- Account Number
    Register    700000000    1234    John    Doe
    Wait Until Page Contains Element    //*[@cid='register-error-mes']
    Wait Until Page Contains    Please fill accountId ${SPACE}10 digits

TC3: Register with min+, max+ Account Number
    Register    70000000000    1234    John    Doe
    Wait Until Page Contains Element    //*[@cid='register-error-mes']
    Wait Until Page Contains    Please fill accountId ${SPACE}10 digits

TC4: Register with Account Number that is already existed
    Register    7000000000    1234    John    Doe
    Wait Until Page Contains Element    //*[@cid='register-error-mes']
    Wait Until Page Contains    Account ID already existed

TC5: Register with Account Number that is not number
    Register    700000000X    1234    John    Doe
    Wait Until Page Contains Element    //*[@cid='register-error-mes']
    Wait Until Page Contains    Please put accountId only number

TC6: Register with min-, max- Password
    Register    7000000000    123    John    Doe
    Wait Until Page Contains Element    //*[@cid='register-error-mes']
    Wait Until Page Contains    Please fill password 4 digits

TC7: Register with min+, max+ Password
    Register    7000000000    12345    John    Doe
    Wait Until Page Contains Element    //*[@cid='register-error-mes']
    Wait Until Page Contains    Please fill password 4 digits

TC8: Register with Password that is not number
    Register    7000000000    123X    John    Doe
    Wait Until Page Contains Element    //*[@cid='register-error-mes']
    Wait Until Page Contains    Please put password only number

TC9: Register with First Name is empty
    Register    7000000000    1234    John    Doe    ${False}    ${True}
    ${validationMessage}    Get Element Attribute    //*[@id='firstName']    validationMessage
    Should Be Equal    ${validationMessage}    Please fill out this field.

TC10: Register with Last Name is empty
    Register    7000000000    1234    John    Doe    ${True}    ${False}
    ${validationMessage}    Get Element Attribute    //*[@id='lastName']    validationMessage
    Should Be Equal    ${validationMessage}    Please fill out this field.

TC15: Register with name length exceed 30 digits
    Register    7000000000    1234    12345678901234567890    1234567890
    Wait Until Page Contains Element    //*[@cid='register-error-mes']
    Wait Until Page Contains    your name length is exceed 30 digits
