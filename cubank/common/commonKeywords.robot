*** Settings ***
Library    SeleniumLibrary
Resource    ../data/environment.robot
Resource    ../data/element.robot

*** Keywords ***
Login
    Open Browser    ${WEB_URL}    ${WEB_BROWSER}
    Maximize Browser Window

    Input Text    ${LOGIN_ACCOUNT_NUMBER_FIELD}    ${ACCOUNT_NUMBER}
    Input Text    ${LOGIN_PASSWORD_FIELD}    ${PASSWORD}    text

    # Click the Login Btn
    Click Button    ${LOGIN_BTN}

    # Wait Until the Account Page is loaded
    Wait Until Location Is    ${WEB_URL}/account/

    Page Should Contain    Account ID:
    Page Should Contain    ${ACCOUNT_NUMBER}
    Page Should Contain Link    ${LOGOUT_BTN}


