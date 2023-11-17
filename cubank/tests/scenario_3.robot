*** Settings ***
Library             SeleniumLibrary
Resource            ../common/commonKeywords.robot
Resource            ../data/element.robot
Resource            ../data/environment.robot

Test Teardown       Close All Browsers


*** Test Cases ***
TC25: Deposit with min- Amount
    ${amount}    Set Variable    0

    Login    ${WEB_URL}    ${WEB_BROWSER}    ${ACCOUNT_NUMBER_S3}    ${PASSWORD_S3}

    Wait Until Page Contains Element    ${DEPOSIT_CARD}

    Input Text    ${DEPOSIT_AMOUNT_FIELD}    ${amount}
    # Click the Confirm Button
    Click Element    ${DEPOSIT_BTN}
    Wait Until Page Contains Element    //*[@cid='deposite-error-mes']
    Wait Until Page Contains    Please put only number

TC29: Deposit with floating number Amount
    ${amount}    Set Variable    19.89

    Login    ${WEB_URL}    ${WEB_BROWSER}    ${ACCOUNT_NUMBER_S3}    ${PASSWORD_S3}

    Wait Until Page Contains Element    ${DEPOSIT_CARD}

    Input Text    ${DEPOSIT_AMOUNT_FIELD}    ${amount}
    # Click the Confirm Button
    Click Element    ${DEPOSIT_BTN}
    ${validationMessage}    Get Element Attribute    //*[@cid='d1']    validationMessage
    Should Be Equal    ${validationMessage}    Please enter a valid value. The two nearest valid values are 19 and 20.
