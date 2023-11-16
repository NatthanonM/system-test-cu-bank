*** Settings ***
Library    SeleniumLibrary
Resource    ../testdata/element.robot

*** Keywords ***
Login
    [Arguments]    ${web_url}    ${web_browser}    ${account_number}    ${password}
    Open Browser    ${web_url}    ${web_browser}
    Maximize Browser Window

    Input Text    ${LOGIN_ACCOUNT_NUMBER_FIELD}    ${account_number}
    Input Text    ${LOGIN_PASSWORD_FIELD}    ${password}

    # Click the Login Btn
    Click Button    ${LOGIN_BTN}

    # Wait Until the Account Page is loaded
    Wait Until Location Is    ${WEB_URL}/account/

    Wait Until Page Contains    Account ID:
    Wait Until Page Contains    ${account_number}
    Page Should Contain Link   ${LOGOUT_BTN}
