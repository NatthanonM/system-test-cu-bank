*** Settings ***
Library    SeleniumLibrary

Resource    ../testdata/environment.robot

Test Teardown    Close All Browsers

*** Test Cases ***
TC2: Register with min-, max- Account Number
    Open Browser    ${WEB_URL}/register    ${WEB_BROWSER}
    Maximize Browser Window

    Input Text    //*[@id='accountId']    700000000
    Input Text    //*[@id='password']    1234
    Input Text    //*[@id='firstName']    John
    Input Text    //*[@id='lastName']    Doe
    Click Element    //*[@cid='rc']
    Wait Until Page Contains Element    //*[@cid='register-error-mes']
    Wait Until Page Contains    Please fill accountId ${SPACE}10 digits

TC3: Register with min+, max+ Account Number
    Open Browser    ${WEB_URL}/register    ${WEB_BROWSER}
    Maximize Browser Window

    Input Text    //*[@id='accountId']    70000000000
    Input Text    //*[@id='password']    1234
    Input Text    //*[@id='firstName']    John
    Input Text    //*[@id='lastName']    Doe
    Click Element    //*[@cid='rc']
    Wait Until Page Contains Element    //*[@cid='register-error-mes']
    Wait Until Page Contains    Please fill accountId ${SPACE}10 digits

TC4: Register with Account Number that is already existed
    Open Browser    ${WEB_URL}/register    ${WEB_BROWSER}
    Maximize Browser Window

    Input Text    //*[@id='accountId']    7000000000
    Input Text    //*[@id='password']    1234
    Input Text    //*[@id='firstName']    John
    Input Text    //*[@id='lastName']    Doe
    Click Element    //*[@cid='rc']
    Wait Until Page Contains Element    //*[@cid='register-error-mes']
    Wait Until Page Contains    Account ID already existed

TC5: Register with Account Number that is not number
    Open Browser    ${WEB_URL}/register    ${WEB_BROWSER}
    Maximize Browser Window

    Input Text    //*[@id='accountId']    700000000X
    Input Text    //*[@id='password']    1234
    Input Text    //*[@id='firstName']    John
    Input Text    //*[@id='lastName']    Doe
    Click Element    //*[@cid='rc']
    Wait Until Page Contains Element    //*[@cid='register-error-mes']
    Wait Until Page Contains    Please put accountId only number

TC6: Register with min-, max- Password
    Open Browser    ${WEB_URL}/register    ${WEB_BROWSER}
    Maximize Browser Window

    Input Text    //*[@id='accountId']    7000000000
    Input Text    //*[@id='password']    123
    Input Text    //*[@id='firstName']    John
    Input Text    //*[@id='lastName']    Doe
    Click Element    //*[@cid='rc']
    Wait Until Page Contains Element    //*[@cid='register-error-mes']
    Wait Until Page Contains    Please fill password 4 digits

TC7: Register with min+, max+ Password
    Open Browser    ${WEB_URL}/register    ${WEB_BROWSER}
    Maximize Browser Window

    Input Text    //*[@id='accountId']    7000000000
    Input Text    //*[@id='password']    12345
    Input Text    //*[@id='firstName']    John
    Input Text    //*[@id='lastName']    Doe
    Click Element    //*[@cid='rc']
    Wait Until Page Contains Element    //*[@cid='register-error-mes']
    Wait Until Page Contains    Please fill password 4 digits

TC8: Register with Password that is not number
    Open Browser    ${WEB_URL}/register    ${WEB_BROWSER}
    Maximize Browser Window

    Input Text    //*[@id='accountId']    7000000000
    Input Text    //*[@id='password']    1234X
    Input Text    //*[@id='firstName']    John
    Input Text    //*[@id='lastName']    Doe
    Click Element    //*[@cid='rc']
    Wait Until Page Contains Element    //*[@cid='register-error-mes']
    Wait Until Page Contains    Please put password only number

TC9: Register with First Name is empty
    Open Browser    ${WEB_URL}/register    ${WEB_BROWSER}
    Maximize Browser Window

    Input Text    //*[@id='accountId']    7000000000
    Input Text    //*[@id='password']    1234
    # Input Text    //*[@id='firstName']    John
    Input Text    //*[@id='lastName']    Doe
    Click Element    //*[@cid='rc']
    ${validationMessage}=    Get Element Attribute    //*[@id='firstName']    validationMessage
    Should Be Equal    ${validationMessage}    Please fill out this field.

TC10: Register with Last Name is empty
    Open Browser    ${WEB_URL}/register    ${WEB_BROWSER}
    Maximize Browser Window

    Input Text    //*[@id='accountId']    7000000000
    Input Text    //*[@id='password']    1234
    Input Text    //*[@id='firstName']    John
    # Input Text    //*[@id='lastName']    Doe
    Click Element    //*[@cid='rc']
    ${validationMessage}=    Get Element Attribute    //*[@id='lastName']    validationMessage
    Should Be Equal    ${validationMessage}    Please fill out this field.

TC15: Register with name length exceed 30 digits
    Open Browser    ${WEB_URL}/register    ${WEB_BROWSER}
    Maximize Browser Window

    Input Text    //*[@id='accountId']    7000000000
    Input Text    //*[@id='password']    1234
    Input Text    //*[@id='firstName']    12345678901234567890
    Input Text    //*[@id='lastName']    1234567890
    Click Element    //*[@cid='rc']
    Wait Until Page Contains Element    //*[@cid='register-error-mes']
    Wait Until Page Contains    your name length is exceed 30 digits