*** Settings ***
Library     SeleniumLibrary
Resource    ../data/environment.robot
Resource    ../data/element.robot


*** Keywords ***
Open Login Page
    Open Browser    ${WEB_URL}    ${WEB_BROWSER}
    Maximize Browser Window

Open Register Page
    Open Browser    ${WEB_URL}/register    ${WEB_BROWSER}
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

Register Success
    [Arguments]    ${accountId}    ${password}    ${firstName}    ${lastName}

    Input Text    name:accountId    ${accountId}
    Input Text    name:password    ${password}
    Input Text    name:firstName    ${firstName}
    Input Text    name:lastName    ${lastName}

    Click Button    ${REGISTER_BTN}

    Alert Should Be Present    success    ACCEPT
