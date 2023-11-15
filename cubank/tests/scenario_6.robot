*** Settings ***
Library    SeleniumLibrary

Resource    ../common/commonKeywords.robot
Resource    ../data/environment.robot

Test Teardown    Close All Browsers

*** Test Cases ***
TC54: Bill Payment with Invalid Payment Target
    ${amount}    Set Variable    50

    Login    ${WEB_URL}    ${WEB_BROWSER}    ${ACCOUNT_NUMBER}    ${PASSWORD} 
    Deposit    ${WEB_URL}    ${amount}

    Wait Until Page Contains Element    ${BILL_PAYMENT_CARD}

    # Click the Confirm Button
    Click Button    ${BILL_PAYMENT_BTN}
    # The Balance Should be Equal to the Amount
    Wait Until Page Contains    ${amount}

    Withdraw    ${WEB_URL}    ${amount}

TC56: Bill Payment with Amount = 0
    ${amount}    Set Variable    50
    Login    ${WEB_URL}    ${WEB_BROWSER}    ${ACCOUNT_NUMBER}    ${PASSWORD} 
    Deposit    ${WEB_URL}    ${amount}

    Wait Until Page Contains Element    ${BILL_PAYMENT_CARD}

    # Select the Payment Target
    # Select From List By Value    ${PAYMENT_TARGET}    Electric Charge
    Click Element    ${PAYMENT_TARGET}/input[2]
    # Fill the Amount Field
    Input Text    ${BILL_PAYMENT_AMOUNT_FIELD}    0
    Click Button    ${BILL_PAYMENT_BTN}

    Wait Until Page Contains    Please put only number
    Withdraw    ${WEB_URL}    ${amount}

TC60: Bill Payment with Insufficient Balance
    ${amount}    Set Variable    50
    Login    ${WEB_URL}    ${WEB_BROWSER}    ${ACCOUNT_NUMBER}    ${PASSWORD} 
    Deposit    ${WEB_URL}    ${amount}

    Wait Until Page Contains Element    ${BILL_PAYMENT_CARD}

    # Select the Payment Target
    # Select From List By Value    ${PAYMENT_TARGET}    Electric Charge
    Click Element    ${PAYMENT_TARGET}/input[2]
    # Fill the Amount Field
    ${pay_amount}=    Evaluate    int(${amount}) + 1
    Input Text    ${BILL_PAYMENT_AMOUNT_FIELD}    ${pay_amount}
    Click Button    ${BILL_PAYMENT_BTN}

    Wait Until Page Contains    your balance isn't not enough
    Withdraw    ${WEB_URL}    ${amount}

TC61: Bill Payment with a Decimal Amount
    ${amount}    Set Variable    50
    Login    ${WEB_URL}    ${WEB_BROWSER}    ${ACCOUNT_NUMBER}    ${PASSWORD} 
    Deposit    ${WEB_URL}    ${amount}

    Wait Until Page Contains Element    ${BILL_PAYMENT_CARD}

    # Select the Payment Target
    Click Element    ${PAYMENT_TARGET}/input[2]
    # Fill the Amount Field
    ${pay_amount}=    Evaluate    int(${amount}) / 2 + 0.1
    Log To Console    ${pay_amount}
    Input Text    ${BILL_PAYMENT_AMOUNT_FIELD}    ${pay_amount}
    Click Button    ${BILL_PAYMENT_BTN}

    # The Balance Should be Equal to the Amount
    Wait Until Page Contains    ${amount}

    Withdraw    ${WEB_URL}    ${amount}

    