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
    ${current_value}=    Convert To Integer    ${current_value}
    ${check_value}=    Evaluate    ${amount} - ${pay_amount}
    Should Be Equal    ${current_value}    ${check_value}

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
    ${current_value}=    Convert To Integer    ${current_value}
    ${check_value}=    Evaluate    ${amount} - ${pay_amount}
    Should Be Equal    ${current_value}    ${check_value}

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
    ${current_value}=    Convert To Integer    ${current_value}
    ${check_value}=    Evaluate    ${amount} - ${pay_amount}
    Should Be Equal    ${current_value}    ${check_value}
    
    Withdraw    ${WEB_URL}    ${current_value}

TC55: Bill Payment with the Minimum Amount
    ${amount}    Set Variable    50
    Login    ${WEB_URL}    ${WEB_BROWSER}    ${ACCOUNT_NUMBER}    ${PASSWORD} 
    Deposit    ${WEB_URL}    ${amount}

    Wait Until Element Is Visible    ${BILL_PAYMENT_CARD}

    # Select the Payment Target
    Click Element    ${PAYMENT_TARGET}/input[2]
    # Fill the Amount Field
    Input Text    ${BILL_PAYMENT_AMOUNT_FIELD}    1
    Click Button    ${BILL_PAYMENT_BTN}

    Reload Page
    Wait Until Element Is Visible   ${CURRENT_BALANCE}
    ${current_value}=    Get Text    ${CURRENT_BALANCE}
    ${current_value}=    Convert To Integer    ${current_value}
    ${check_value}=    Evaluate    ${amount} - 1
    Should Be Equal    ${current_value}    ${check_value}

    Withdraw    ${WEB_URL}    ${current_value}

TC57: Bill Payment with min+ Amount
    ${amount}    Set Variable    50
    Login    ${WEB_URL}    ${WEB_BROWSER}    ${ACCOUNT_NUMBER}    ${PASSWORD} 
    Deposit    ${WEB_URL}    ${amount}

    Wait Until Element Is Visible    ${BILL_PAYMENT_CARD}

    # Select the Payment Target
    Click Element    ${PAYMENT_TARGET}/input[2]
    # Fill the Amount Field
    Input Text    ${BILL_PAYMENT_AMOUNT_FIELD}    2
    Click Button    ${BILL_PAYMENT_BTN}

    Reload Page
    Wait Until Element Is Visible   ${CURRENT_BALANCE}
    ${current_value}=    Get Text    ${CURRENT_BALANCE}
    ${current_value}=    Convert To Integer    ${current_value}
    ${check_value}=    Evaluate    ${amount} - 2
    Should Be Equal    ${current_value}    ${check_value}

    Withdraw    ${WEB_URL}    ${current_value}

TC58: Bill Payment with Maximum Amount
    ${amount}    Set Variable    50
    Login    ${WEB_URL}    ${WEB_BROWSER}    ${ACCOUNT_NUMBER}    ${PASSWORD} 
    Deposit    ${WEB_URL}    ${amount}

    Wait Until Element Is Visible    ${BILL_PAYMENT_CARD}

    # Select the Payment Target
    Click Element    ${PAYMENT_TARGET}/input[2]
    # Fill the Amount Field
    Input Text    ${BILL_PAYMENT_AMOUNT_FIELD}    ${amount}
    Click Button    ${BILL_PAYMENT_BTN}

    Reload Page
    Wait Until Element Is Visible   ${CURRENT_BALANCE}
    ${current_value}=    Get Text    ${CURRENT_BALANCE}
    Should Be Equal    ${current_value}    0

    Withdraw    ${WEB_URL}    ${current_value}

TC59: Bill Payment with Max- Amount
    ${amount}    Set Variable    50
    Login    ${WEB_URL}    ${WEB_BROWSER}    ${ACCOUNT_NUMBER}    ${PASSWORD} 
    Deposit    ${WEB_URL}    ${amount}

    Wait Until Element Is Visible    ${BILL_PAYMENT_CARD}
    ${pay_amount}=    Evaluate    ${amount} - 1

    # Select the Payment Target
    Click Element    ${PAYMENT_TARGET}/input[2]
    # Fill the Amount Field
    Input Text    ${BILL_PAYMENT_AMOUNT_FIELD}    ${pay_amount}
    Click Button    ${BILL_PAYMENT_BTN}

    Reload Page
    Wait Until Element Is Visible   ${CURRENT_BALANCE}
    ${current_value}=    Get Text    ${CURRENT_BALANCE}
    Should Be Equal    ${current_value}    1

    Withdraw    ${WEB_URL}    ${current_value}