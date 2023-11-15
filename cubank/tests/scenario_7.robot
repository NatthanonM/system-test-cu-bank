*** Settings ***
Library    SeleniumLibrary

Resource    ../common/commonKeywords.robot
Resource    ../data/environment.robot

Test Teardown    Close All Browsers

*** Test Cases ***
TC51: Bill Payment with Water Charge Payment Target
    ${amount}    Set Variable    50
    Login    ${WEB_URL}    ${WEB_BROWSER}    ${ACCOUNT_NUMBER}    ${PASSWORD} 
    Deposit    ${WEB_URL}    ${amount}

    Wait Until Element Is Visible    ${BILL_PAYMENT_CARD}

    # Select the Payment Target
    Click Element    ${PAYMENT_TARGET}/input[1]
    # Fill the Amount Field
    ${pay_amount}=    Evaluate    int(${amount}) // 2
    Input Text    ${BILL_PAYMENT_AMOUNT_FIELD}    ${pay_amount}
    Click Button    ${BILL_PAYMENT_BTN}

    Reload Page
    Wait Until Element Is Visible   ${CURRENT_BALANCE}
    ${current_value}=    Get Text    ${CURRENT_BALANCE}
    Withdraw    ${WEB_URL}    ${current_value}

TC52: Bill Payment with Electric Charge Payment Target
    ${amount}    Set Variable    50
    Login    ${WEB_URL}    ${WEB_BROWSER}    ${ACCOUNT_NUMBER}    ${PASSWORD} 
    Deposit    ${WEB_URL}    ${amount}

    Wait Until Element Is Visible    ${BILL_PAYMENT_CARD}

    # Select the Payment Target
    Click Element    ${PAYMENT_TARGET}/input[2]
    # Fill the Amount Field
    ${pay_amount}=    Evaluate    int(${amount}) // 2
    Input Text    ${BILL_PAYMENT_AMOUNT_FIELD}    ${pay_amount}
    Click Button    ${BILL_PAYMENT_BTN}

    Reload Page
    Wait Until Element Is Visible   ${CURRENT_BALANCE}
    ${current_value}=    Get Text    ${CURRENT_BALANCE}
    Withdraw    ${WEB_URL}    ${current_value}

TC53: Bill Payment with Phone Charge Payment Target
    ${amount}    Set Variable    50
    Login    ${WEB_URL}    ${WEB_BROWSER}    ${ACCOUNT_NUMBER}    ${PASSWORD} 
    Deposit    ${WEB_URL}    ${amount}

    Wait Until Element Is Visible    ${BILL_PAYMENT_CARD}

    # Select the Payment Target
    Click Element    ${PAYMENT_TARGET}/input[3]
    # Fill the Amount Field
    ${pay_amount}=    Evaluate    int(${amount}) // 2
    Input Text    ${BILL_PAYMENT_AMOUNT_FIELD}    ${pay_amount}
    Click Button    ${BILL_PAYMENT_BTN}

    Reload Page
    Wait Until Element Is Visible   ${CURRENT_BALANCE}
    ${current_value}=    Get Text    ${CURRENT_BALANCE}
    Withdraw    ${WEB_URL}    ${current_value}