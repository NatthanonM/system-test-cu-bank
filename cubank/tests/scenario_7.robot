*** Settings ***
Library             SeleniumLibrary
Resource            ../common/commonKeywords.robot
Resource            ../data/environment.robot

Test Teardown       Close All Browsers


*** Test Cases ***
S7.1: TC16 (login success), TC53 (bill payment success with Water Charge payment target)
    ${amount}=    Set Variable    50
    Login    ${WEB_URL}    ${WEB_BROWSER}    ${ACCOUNT_NUMBER}    ${PASSWORD}
    Deposit    ${WEB_URL}    ${amount}

    Sleep    1
    Wait Until Element Is Visible    ${BILL_PAYMENT_CARD}

    # Select the Payment Target
    Click Element    ${PAYMENT_TARGET}/input[1]
    # Fill the Amount Field
    ${pay_amount}=    Evaluate    int(${amount}) // 2
    Input Text    ${BILL_PAYMENT_AMOUNT_FIELD}    ${pay_amount}
    Click Button    ${BILL_PAYMENT_BTN}

    Sleep    2
    Wait Until Element Is Visible    ${CURRENT_BALANCE}
    ${current_value}=    Get Text    ${CURRENT_BALANCE}
    ${current_value}=    Convert To Integer    ${current_value}
    ${check_value}=    Evaluate    ${amount} - ${pay_amount}
    Should Be Equal    ${current_value}    ${check_value}

    Withdraw    ${WEB_URL}    ${current_value}

S7.2: TC16 (login success), TC54 (bill payment success with Electric Charge payment target)
    ${amount}=    Set Variable    50
    Login    ${WEB_URL}    ${WEB_BROWSER}    ${ACCOUNT_NUMBER}    ${PASSWORD}
    Deposit    ${WEB_URL}    ${amount}

    Sleep    1
    Wait Until Element Is Visible    ${BILL_PAYMENT_CARD}

    # Select the Payment Target
    Click Element    ${PAYMENT_TARGET}/input[2]
    # Fill the Amount Field
    ${pay_amount}=    Evaluate    int(${amount}) // 2
    Input Text    ${BILL_PAYMENT_AMOUNT_FIELD}    ${pay_amount}
    Click Button    ${BILL_PAYMENT_BTN}

    Sleep    2
    Wait Until Element Is Visible    ${CURRENT_BALANCE}
    ${current_value}=    Get Text    ${CURRENT_BALANCE}
    ${current_value}=    Convert To Integer    ${current_value}
    ${check_value}=    Evaluate    ${amount} - ${pay_amount}
    Should Be Equal    ${current_value}    ${check_value}

    Withdraw    ${WEB_URL}    ${current_value}

S7.3: TC16 (login success), TC55 (bill payment success with Phone Charge payment target)
    ${amount}=    Set Variable    50
    Login    ${WEB_URL}    ${WEB_BROWSER}    ${ACCOUNT_NUMBER}    ${PASSWORD}
    Deposit    ${WEB_URL}    ${amount}

    Sleep    1
    Wait Until Element Is Visible    ${BILL_PAYMENT_CARD}

    # Select the Payment Target
    Click Element    ${PAYMENT_TARGET}/input[3]
    # Fill the Amount Field
    ${pay_amount}=    Evaluate    int(${amount}) // 2
    Input Text    ${BILL_PAYMENT_AMOUNT_FIELD}    ${pay_amount}
    Click Button    ${BILL_PAYMENT_BTN}

    Sleep    2
    Wait Until Element Is Visible    ${CURRENT_BALANCE}
    ${current_value}=    Get Text    ${CURRENT_BALANCE}
    ${current_value}=    Convert To Integer    ${current_value}
    ${check_value}=    Evaluate    ${amount} - ${pay_amount}
    Should Be Equal    ${current_value}    ${check_value}

    Withdraw    ${WEB_URL}    ${current_value}

S7.4: TC16 (login success), TC57 (bill payment success with min amount)
    ${amount}=    Set Variable    50
    Login    ${WEB_URL}    ${WEB_BROWSER}    ${ACCOUNT_NUMBER}    ${PASSWORD}
    Deposit    ${WEB_URL}    ${amount}

    Sleep    1
    Wait Until Element Is Visible    ${BILL_PAYMENT_CARD}

    # Select the Payment Target
    Click Element    ${PAYMENT_TARGET}/input[2]
    # Fill the Amount Field
    Input Text    ${BILL_PAYMENT_AMOUNT_FIELD}    1
    Click Button    ${BILL_PAYMENT_BTN}

    Sleep    2
    Wait Until Element Is Visible    ${CURRENT_BALANCE}
    ${current_value}=    Get Text    ${CURRENT_BALANCE}
    ${current_value}=    Convert To Integer    ${current_value}
    ${check_value}=    Evaluate    ${amount} - 1
    Should Be Equal    ${current_value}    ${check_value}

    Withdraw    ${WEB_URL}    ${current_value}

S7.5: TC16 (login success), TC59 (bill payment success with min+ amount)
    ${amount}=    Set Variable    50
    Login    ${WEB_URL}    ${WEB_BROWSER}    ${ACCOUNT_NUMBER}    ${PASSWORD}
    Deposit    ${WEB_URL}    ${amount}

    Sleep    1
    Wait Until Element Is Visible    ${BILL_PAYMENT_CARD}

    # Select the Payment Target
    Click Element    ${PAYMENT_TARGET}/input[2]
    # Fill the Amount Field
    Input Text    ${BILL_PAYMENT_AMOUNT_FIELD}    2
    Click Button    ${BILL_PAYMENT_BTN}

    Sleep    2
    Wait Until Element Is Visible    ${CURRENT_BALANCE}
    ${current_value}=    Get Text    ${CURRENT_BALANCE}
    ${current_value}=    Convert To Integer    ${current_value}
    ${check_value}=    Evaluate    ${amount} - 2
    Should Be Equal    ${current_value}    ${check_value}

    Withdraw    ${WEB_URL}    ${current_value}

S7.6: TC16 (login success), TC60 (bill payment success with max amount)
    ${amount}=    Set Variable    50
    Login    ${WEB_URL}    ${WEB_BROWSER}    ${ACCOUNT_NUMBER}    ${PASSWORD}
    Deposit    ${WEB_URL}    ${amount}

    Sleep    1
    Wait Until Element Is Visible    ${BILL_PAYMENT_CARD}

    # Select the Payment Target
    Click Element    ${PAYMENT_TARGET}/input[2]
    # Fill the Amount Field
    Input Text    ${BILL_PAYMENT_AMOUNT_FIELD}    ${amount}
    Click Button    ${BILL_PAYMENT_BTN}

    Sleep    2
    Wait Until Element Is Visible    ${CURRENT_BALANCE}
    ${current_value}=    Get Text    ${CURRENT_BALANCE}
    Should Be Equal    ${current_value}    0

    Withdraw    ${WEB_URL}    ${current_value}

S7.7: TC16 (login success), TC61 (bill payment success with max- amount)
    ${amount}=    Set Variable    50
    Login    ${WEB_URL}    ${WEB_BROWSER}    ${ACCOUNT_NUMBER}    ${PASSWORD}
    Deposit    ${WEB_URL}    ${amount}

    Sleep    1
    Wait Until Element Is Visible    ${BILL_PAYMENT_CARD}
    ${pay_amount}=    Evaluate    ${amount} - 1

    # Select the Payment Target
    Click Element    ${PAYMENT_TARGET}/input[2]
    # Fill the Amount Field
    Input Text    ${BILL_PAYMENT_AMOUNT_FIELD}    ${pay_amount}
    Click Button    ${BILL_PAYMENT_BTN}

    Sleep    2
    Wait Until Element Is Visible    ${CURRENT_BALANCE}
    ${current_value}=    Get Text    ${CURRENT_BALANCE}
    Should Be Equal    ${current_value}    1

    Withdraw    ${WEB_URL}    ${current_value}
