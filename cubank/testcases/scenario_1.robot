*** Settings ***
Library    SeleniumLibrary

Resource    ../keywords/commonKeywords.robot
Resource    ../testdata/environment.robot

Test Teardown    Close All Browsers

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
    ${account_number}    Set Variable    7000000000
    ${password}    Set Variable    1234
    ${first_name}    Set Variable    John
    ${last_name}    Set Variable    Doe
    Register    ${account_number}   ${password}    ${first_name}    ${last_name}
    sleep    3
    Handle Alert
    sleep    3
    Go To    ${WEB_URL}/register
    Input Text    //*[@id='accountId']    ${account_number}
    Input Text    //*[@id='password']    ${password}
    Input Text    //*[@id='firstName']    ${first_name}
    Input Text    //*[@id='lastName']    ${last_name}
    Click Element    //*[@cid='rc']
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
    ${validationMessage}=    Get Element Attribute    //*[@id='firstName']    validationMessage
    Should Be Equal    ${validationMessage}    Please fill out this field.

TC10: Register with Last Name is empty
    Register    7000000000    1234    John    Doe    ${True}    ${False}
    ${validationMessage}=    Get Element Attribute    //*[@id='lastName']    validationMessage
    Should Be Equal    ${validationMessage}    Please fill out this field.

TC15: Register with name length exceed 30 digits
    Register    7000000000    1234    12345678901234567890    1234567890
    Wait Until Page Contains Element    //*[@cid='register-error-mes']
    Wait Until Page Contains    your name length is exceed 30 digits