*** Settings ***
Library     SeleniumLibrary
Resource    ../data/environment.robot
Resource    ../data/element.robot


*** Variables ***
${GLOBALTIMEOUT}        ${15}
${GLOBALWAITTIME}       ${5}
${SPEEDTIME}            ${1}
${BROWSER}              chrome


*** Keywords ***
Open Login Page
    Open Browser    ${WEB_URL}    ${WEB_BROWSER}
    Maximize Browser Window

Open Register Page
    Open Browser    ${WEB_URL}/register    ${WEB_BROWSER}
    Maximize Browser Window

Login
    [Arguments]    ${web_url}    ${web_browser}    ${account_number}    ${password}
    Open Browser    ${web_url}    ${web_browser}
    Maximize Browser Window

    Input Text    ${LOGIN_ACCOUNT_NUMBER_FIELD}    ${account_number}
    Input Text    ${LOGIN_PASSWORD_FIELD}    ${password}

    # Click the Login Btn
    Click Button    ${LOGIN_BTN}

    Sleep    1
    # Wait Until the Account Page is loaded
    Wait Until Location Is    ${WEB_URL}/account/

    Wait Until Page Contains    Account ID:
    Wait Until Page Contains    ${account_number}
    Page Should Contain Link    ${LOGOUT_BTN}

Deposit
    [Arguments]    ${web_url}    ${amount}
    Wait Until Page Contains Element    ${DEPOSIT_CARD}

    ${current_value}=    Get Text    ${CURRENT_BALANCE}
    ${current_value}=    Convert To Integer    ${current_value}

    Input Text    ${DEPOSIT_AMOUNT_FIELD}    ${amount}
    # Click the Confirm Button
    Click Element    ${DEPOSIT_BTN}

    Sleep    1
    Wait Until Location Is    ${web_url}/account/
    ${amount}=    Convert To Integer    ${amount}
    ${updated_value}=    Get Text    ${CURRENT_BALANCE}
    ${correct_value}=    Evaluate    ${current_value} + ${amount}
    Wait Until Page Contains    ${correct_value}

Withdraw
    [Arguments]    ${web_url}    ${amount}
    Wait Until Page Contains Element    ${WITHDRAW_CARD}

    ${current_value}=    Get Text    ${CURRENT_BALANCE}
    ${current_value}=    Convert To Integer    ${current_value}

    Input Text    ${WITHDRAW_AMOUNT_FIELD}    ${amount}
    # Click the Confirm Button
    Click Element    ${WITHDRAW_BTN}

    Sleep    1
    Wait Until Location Is    ${web_url}/account/
    ${amount}=    Convert To Integer    ${amount}
    ${updated_value}=    Get Text    ${CURRENT_BALANCE}
    ${correct_value}=    Evaluate    ${current_value} - ${amount}
    Wait Until Page Contains    ${correct_value}

Login Failed
    [Arguments]
    ...    ${accountId}
    ...    ${password}
    ...    ${errmsg}
    ...    ${isValidationMessage}=${False}
    ...    ${errfield}=${LOGIN_ERROR_MESSAGE_FIELD}

    Input Text    ${LOGIN_ACCOUNT_NUMBER_FIELD}    ${accountId}
    Input Text    ${LOGIN_PASSWORD_FIELD}    ${password}

    # Click the Login Btn
    Click Button    ${LOGIN_BTN}

    IF    not ${isValidationMessage}
        # error message from system error
        Wait Until Element Contains    ${errfield}    ${errmsg}
    ELSE
        # error message from validation message
        ${validationMessage}=    Get Element Attribute    ${errfield}    validationMessage
        Should Be Equal    ${validationMessage}    ${errmsg}
    END

Register Success
    [Arguments]    ${accountId}    ${password}    ${firstName}    ${lastName}

    Input Text    name:accountId    ${accountId}
    Input Text    name:password    ${password}
    Input Text    name:firstName    ${firstName}
    Input Text    name:lastName    ${lastName}

    Click Button    ${REGISTER_BTN}

    Alert Should Be Present    success    ACCEPT

Common Open Browser keyoniq
    Open Browser    ${URL_KEYONIQ}    ${BROWSER}
    sleep    ${SPEEDTIME}

Common Open new tab for keyoniq
    Open Browser    ${URL_KEYONIQ}    ${BROWSER}    alias=tab1
    sleep    ${SPEEDTIME}

Common Open Browser keyoniq mobile
    Open Browser    ${URL_KEYONIQ_MOBILE}    ${BROWSER}
    sleep    ${SPEEDTIME}

Common set Maximize Browser
    Maximize Browser Window
    sleep    ${SPEEDTIME}

Wait Until Page Is Completely Loaded
    Wait Until Page Is Completely Loaded

Click Element
    [Documentation]    ${locator} - could be any selenium locator and webelement object
    ...    ${timeout} - <optional>
    ...    Make sure that ${GLOBALTIMEOUT} can be accessed globally
    [Arguments]    ${locator}    ${timeout}=${GLOBALTIMEOUT}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    timeout=${timeout}
    SeleniumLibrary.Click Element    ${locator}

Double Click Element
    [Arguments]    ${locator}    ${timeout}=${GLOBALTIMEOUT}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    timeout=${timeout}
    SeleniumLibrary.Double Click Element    ${locator}

Verify Web Element Text Should Be Equal
    [Documentation]    ${locator} - could be any selenium locator and webelement object
    ...    ${expected_text} - text to be verified
    [Arguments]    ${locator}    ${expected_text}
    CommonWebKeywords.Verify Web Elements Are Visible    ${locator}
    SeleniumLibrary.Element Text Should Be    ${locator}    ${expected_text}

Verify Web Element Text Should Contain
    [Documentation]    ${locator} - could be any selenium locator and webelement object
    ...    ${expected_text} - text to be verified
    [Arguments]    ${locator}    ${expected_text}
    CommonWebKeywords.Verify Web Elements Are Visible    ${locator}
    SeleniumLibrary.Element Should Contain    ${locator}    ${expected_text}

Verify Web Elements Are Visible
    [Documentation]    This keyword verify that page contains elements specified in arguments and verify each element is visible
    ...    ${elems}    - Varargs of locators or webelements
    [Arguments]    @{elems}
    SeleniumLibrary.Wait Until Page Contains Element    @{elems}[0]    timeout=${GLOBALTIMEOUT}

    FOR    ${elem}    IN    @{elems}
        SeleniumLibrary.Wait Until Element Is Visible    ${elem}    timeout=${GLOBALTIMEOUT}
    END

Verify Web Elements Are Not Visible
    [Documentation]    Able to send argument as single variable or list variables
    [Arguments]    @{elems}
    FOR    ${elem}    IN    @{elems}
        SeleniumLibrary.Wait Until Element Is Not Visible    ${elem}    timeout=${GLOBALTIMEOUT}
    END

Test Teardown
    [Documentation]    All testcase always capture screenshot and all failed case always logs and returns the HTML source of the current page or frame.
    ${sc_fname}=    CommonKeywords.Get Valid File Name    ${TEST_NAME}
    ${status}    ${screenshot_path}=    Run Keyword And Ignore Error
    ...    SeleniumLibrary.Capture Page Screenshot
    ...    ${sc_fname}_{index}.png
    Set Suite Variable    ${${TEST_NAME}}    ${screenshot_path}
    Run Keyword If Test Failed    Run Keyword And Ignore Error    SeleniumLibrary.Log Source

Keyword Teardown
    ${sc_fname}=    CommonKeywords.Get Valid File Name    ${TEST_NAME}
    Run Keyword And Ignore Error    SeleniumLibrary.Capture Page Screenshot    ${sc_fname}_{index}.png
    IF    '${KEYWORD STATUS}'=='FAIL'    SeleniumLibrary.Log Source

Open Browser to page
    [Documentation]    Make sure that ${browser} can be accessed globally
    [Arguments]    ${url}    ${speed}=0.3
    IF    '${browser.lower()}'=='chrome'
        Open Chrome Browser to page    ${url}    ${speed}
    END

Scroll To Element
    [Documentation]    Scroll to element using javascript function 'scrollIntoView'
    ...    ${block} defines of vertical align (start, end, center, nearest)
    [Arguments]    ${locator}    ${block}=center
    SeleniumLibrary.Wait Until Page Contains Element    ${locator}
    ${elem}=    SeleniumLibrary.Get Webelements    ${locator}
    ${s2l}=    Get Library Instance    SeleniumLibrary
    ${driver}=    Evaluate    $s2l._current_browser() if "_current_browser" in dir($s2l) else $s2l._drivers.current
    IF    '${browserName.lower()}'=='safari'
        Call Method    ${driver}    execute_script    arguments[0].scrollIntoViewIfNeeded();    @{elem}[0]
    ELSE
        Call Method    ${driver}    execute_script    arguments[0].scrollIntoView({block: "${block}"});    @{elem}[0]
    END

Scroll To Position Page
    [Documentation]    Scroll to position with x(left-right) and y(top-down)
    [Arguments]    ${x}    ${y}
    Execute Javascript    window.scrollTo(${x}, ${y})

Scroll And Click Element
    [Documentation]    Scroll to element using javascript function 'scrollIntoView' and click an element
    [Arguments]    ${locator}
    Scroll To Element    ${locator}
    CommonWebKeywords.Click Element    ${locator}
