*** Settings ***
Library    SeleniumLibrary
Resource    ../data/element.robot

*** Keywords ***
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
    Page Should Contain Link   ${LOGOUT_BTN}

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





