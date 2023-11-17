*** Settings ***
Library     SeleniumLibrary
Resource    ../data/environment.robot
Resource    ../data/element.robot


*** Keywords ***
Open Login Page
    Open Browser    ${WEB_URL}    ${WEB_BROWSER}
    Maximize Browser Window

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
