*** Settings ***
Library             SeleniumLibrary
Resource            ../common/commonKeywords.robot
Resource            ../data/environment.robot

Test Teardown       Close All Browsers


*** Test Cases ***
S1.1: TC2 (Register Failed with min-, max- Account Number)
    Register    700000000    1234    John    Doe
    Wait Until Page Contains Element    //*[@cid='register-error-mes']
    Wait Until Page Contains    Please fill accountId ${SPACE}10 digits

S1.2: TC3 (Register Failed with min+, max+ Account Number)
    Register    70000000000    1234    John    Doe
    Wait Until Page Contains Element    //*[@cid='register-error-mes']
    Wait Until Page Contains    Please fill accountId ${SPACE}10 digits

S1.3: TC4 (Register Failed with Account Number that is already existed)
    Register    7000000000    1234    John    Doe
    Wait Until Page Contains Element    //*[@cid='register-error-mes']
    Wait Until Page Contains    Account ID already existed

S1.4: TC5 (Register Failed with Account Number that is not number)
    Register    700000000X    1234    John    Doe
    Wait Until Page Contains Element    //*[@cid='register-error-mes']
    Wait Until Page Contains    Please put accountId only number

S1.5: TC6 (Register Failed with min-, max- Password)
    Register    7000000000    123    John    Doe
    Wait Until Page Contains Element    //*[@cid='register-error-mes']
    Wait Until Page Contains    Please fill password 4 digits

S1.6: TC7 (Register Failed with min+, max+ Password)
    Register    7000000000    12345    John    Doe
    Wait Until Page Contains Element    //*[@cid='register-error-mes']
    Wait Until Page Contains    Please fill password 4 digits

S1.7: TC8 (Register Failed with Password that is not number)
    Register    7000000000    123X    John    Doe
    Wait Until Page Contains Element    //*[@cid='register-error-mes']
    Wait Until Page Contains    Please put password only number

S1.8: TC9 (Register Failed with First Name is empty)
    Register    7000000000    1234    John    Doe    ${False}    ${True}
    ${validationMessage}    Get Element Attribute    //*[@id='firstName']    validationMessage
    Should Be Equal    ${validationMessage}    Please fill out this field.

S1.9: TC10 (Register Failed with Last Name is empty)
    Register    7000000000    1234    John    Doe    ${True}    ${False}
    ${validationMessage}    Get Element Attribute    //*[@id='lastName']    validationMessage
    Should Be Equal    ${validationMessage}    Please fill out this field.

S1.10: TC15 (Register Failed with name length exceed 30 digits)
    Register    7000000000    1234    12345678901234567890    1234567890
    Wait Until Page Contains Element    //*[@cid='register-error-mes']
    Wait Until Page Contains    your name length is exceed 30 digits
