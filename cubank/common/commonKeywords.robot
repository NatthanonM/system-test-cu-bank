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

Open browser cubank login page
    Open Browser    ${WEB_URL}    ${WEB_BROWSER}
    Maximize Browser Window
    Sleep    2

Wait cubank login page load complete
    Wait Until Element Contains    //*[@id="root"]/div/div/div/h2    ${login_header}

Register
    [Arguments]
    ...    ${account_number}
    ...    ${password}
    ...    ${first_name}
    ...    ${last_name}
    ...    ${have_first_name}=${True}
    ...    ${have_last_name}=${True}
    Open Browser    ${WEB_URL}/register    ${WEB_BROWSER}
    Maximize Browser Window

    Input Text    //*[@id='accountId']    ${account_number}
    Input Text    //*[@id='password']    ${password}
    IF    ${have_first_name}
        Input Text    //*[@id='firstName']    ${first_name}
    END
    IF    ${have_last_name}    Input Text    //*[@id='lastName']    ${last_name}
    Click Element    //*[@cid='rc']

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

Input and verify account no
    Input text    //*[@id='accountId']    ${test_account_no} 
    ${account_no}    Get Value    //*[@id='accountId']
    Should Be Equal    ${account_no}    ${test_account_no}

Input and verify wrong account no
    Input text    //*[@id='accountId']    ${test_account_wrong} 
    ${account_wrong}    Get Value    //*[@id='accountId']
    Should Be Equal    ${account_wrong}    ${test_account_wrong}

Input and verify wrong_minneg account no
    Input text    //*[@id='accountId']    ${test_account_wrong_minneg} 
    ${account_wrong_minneg}    Get Value    //*[@id='accountId']
    Should Be Equal    ${account_wrong_minneg}    ${test_account_wrong_minneg}

Input and verify wrong_maxplus account no
    Input text    //*[@id='accountId']    ${test_account_wrong_maxplus} 
    ${account_wrong_maxplus}    Get Value    //*[@id='accountId']
    Should Be Equal    ${account_wrong_maxplus}    ${test_account_wrong_maxplus}

Input and verify account password
    Input text    //*[@id='password']    ${test_account_password} 
    ${account_password}    Get Value    //*[@id='password']
    Should Be Equal    ${account_password}    ${test_account_password}

Click login button
    Click Element  //*[@cid='lc']


Wait account page load complete
    Sleep    4
    Wait Until Element Contains    //*[@id="root"]/div/div/div/div/article/h2    ${account_header} 

Input and verify deposit min amount
    Input text    //*[@cid='d1']    ${test_deposit_min} 
    ${deposit_min}    Get Value    //*[@cid='d1']
    Should Be Equal    ${deposit_min}    ${test_deposit_min}

Input and verify deposit min_plus amount
    Input text    //*[@cid='d1']    ${test_deposit_minplus} 
    ${deposit_minplus}    Get Value    //*[@cid='d1']
    Should Be Equal    ${deposit_minplus}    ${test_deposit_minplus}

Input and verify deposit norm amount
    Input text    //*[@cid='d1']    ${test_deposit_norm} 
    ${deposit_norm}    Get Value    //*[@cid='d1']
    Should Be Equal    ${deposit_norm}    ${test_deposit_norm}

Click deposit button
    Click Element  //*[@cid='dc']

Input and verify withdraw min amount
    Input text    //*[@cid='w1']    ${test_withdraw_min} 
    ${withdraw_min}    Get Value    //*[@cid='w1']
    Should Be Equal    ${withdraw_min}    ${test_withdraw_min}

Input and verify withdraw min_plus amount
    Input text    //*[@cid='w1']    ${test_withdraw_minplus} 
    ${withdraw_minplus}    Get Value    //*[@cid='w1']
    Should Be Equal    ${withdraw_minplus}    ${test_withdraw_minplus}

Input and verify withdraw norm amount
    Input text    //*[@cid='w1']    ${test_withdraw_norm} 
    ${withdraw_norm}    Get Value    //*[@cid='w1']
    Should Be Equal    ${withdraw_norm}    ${test_withdraw_norm}

Input and verify withdraw max_neg amount
    Input text    //*[@cid='w1']    ${test_withdraw_maxneg} 
    ${withdraw_maxneg}    Get Value    //*[@cid='w1']
    Should Be Equal    ${withdraw_maxneg}    ${test_withdraw_maxneg}

Input and verify withdraw max amount
    Input text    //*[@cid='w1']    ${test_withdraw_max} 
    ${withdraw_max}    Get Value    //*[@cid='w1']
    Should Be Equal    ${withdraw_max}    ${test_withdraw_max}

Click withdraw button
    Click Element  //*[@cid='wc']

Verify error message
    Wait Until Element Contains    //*[@cid='login-error-mes']   ${test_data_error_message}

Verify error message minneg
    Wait Until Element Contains    //*[@cid='login-error-mes']   ${test_data_error_message_minneg}

Verify error message maxplus
    Wait Until Element Contains    //*[@cid='login-error-mes']   ${test_data_error_message_maxplus}

Input and verify transfer account
    Input text    //*[@cid='t1']    ${test_transfer_acc} 
    ${transfer_acc}    Get Value    //*[@cid='t1']
    Should Be Equal    ${transfer_acc}    ${test_transfer_acc}

Input and verify non-numerical transfer account 
    Input text    //*[@cid='t1']    ${test_non_numerical_transfer_acc} 
    ${transfer_acc}    Get Value    //*[@cid='t1']
    Should Be Equal    ${transfer_acc}    ${test_non_numerical_transfer_acc}

Input and verify transfer amount 
    Input text    //*[@cid='t2']    ${test_transfer_amount} 
    ${transfer_amount}    Get Value    //*[@cid='t2']
    Should Be Equal    ${transfer_amount}    ${test_transfer_amount}

Input and verify invalid transfer amount 
    Input text    //*[@cid='t2']    ${test_invalid_transfer_amount} 
    ${transfer_amount}    Get Value    //*[@cid='t2']
    Should Be Equal    ${transfer_amount}    ${test_invalid_transfer_amount}

Input and verify non-number transfer amount 
    Input text    //*[@cid='t2']    ${test_non_number_transfer_amount} 
    ${transfer_amount}    Get Value    //*[@cid='t2']
    Should Be Equal    ${transfer_amount}    ${test_non_number_transfer_amount}

Input and verify insufficient transfer amount
    Input text    //*[@cid='t2']    ${test_insufficient_transfer_amount} 
    ${transfer_amount}    Get Value    //*[@cid='t2']
    Should Be Equal    ${transfer_amount}    ${test_insufficient_transfer_amount}

Input and verify wrong-digit transfer account 
    Input text    //*[@cid='t1']    ${test_wrong_digit_transfer_acc} 
    ${transfer_acc}    Get Value    //*[@cid='t1']
    Should Be Equal    ${transfer_acc}    ${test_wrong_digit_transfer_acc}

Input and verify wrong-digit_maxplus transfer account
    Input text    //*[@cid='t1']    ${test_wrong_digit_maxplus_transfer_acc} 
    ${transfer_acc}    Get Value    //*[@cid='t1']
    Should Be Equal    ${transfer_acc}    ${test_wrong_digit_maxplus_transfer_acc}

Input and verify not found transfer account
    Input text    //*[@cid='t1']    ${test_not_found_transfer_acc} 
    ${transfer_acc}    Get Value    //*[@cid='t1']
    Should Be Equal    ${transfer_acc}    ${test_not_found_transfer_acc}

Input and verify same transfer account
    Input text    //*[@cid='t1']    ${test_same_transfer_acc} 
    ${transfer_acc}    Get Value    //*[@cid='t1']
    Should Be Equal    ${transfer_acc}    ${test_same_transfer_acc}

Verify transfer error message non-numeric account
    Wait Until Element Contains    //*[@cid='transfer-error-mes']   ${non_numerical_transfer_acc_errmsg}

Verify transfer error message wrong-digit account
    Wait Until Element Contains    //*[@cid='transfer-error-mes']   ${wrong_digit_transfer_acc_errmsg}

Verify transfer error message not found account
    Wait Until Element Contains    //*[@cid='transfer-error-mes']   ${not_found_transfer_acc_errmsg}

Verify transfer error message same account
    Wait Until Element Contains    //*[@cid='transfer-error-mes']   ${same_transfer_acc_errmsg}

Verify transfer error message invalid transfer amount 
    ${invalid_transfer_amount_errmsg}=    Get Element Attribute    //*[@id="root"]/div/div/div/div[5]/div[2]/form/div[2]/label/input    validationMessage
    Should Be Equal    ${invalid_transfer_amount_errmsg}    ${test_invalid_transfer_amount_errmsg}

Verify transfer error message non-number transfer amount
    Wait Until Element Contains    //*[@cid='transfer-error-mes']   ${non_number_transfer_errmsg}

Verify transfer error message insufficient transfer amount
    Wait Until Element Contains    //*[@cid='transfer-error-mes']   ${insufficient_transfer_errmsg}

Click transfer button
    Click Element  //*[@cid='tc']
