*** Settings ***
Library             SeleniumLibrary
Resource            ../common/commonKeywords.robot
Resource            ../data/environment.robot

Test Teardown       Close All Browsers


*** Test Cases ***
TC56: Bill Payment with Invalid Payment Target
    ${amount}    Set Variable    50

    Login    ${WEB_URL}    ${WEB_BROWSER}    ${ACCOUNT_NUMBER}    ${PASSWORD}
    Deposit    ${WEB_URL}    ${amount}

    Sleep    1
    Wait Until Page Contains Element    ${BILL_PAYMENT_CARD}

    # Fill the Amount Field
    ${pay_amount}    Evaluate    int(${amount}) // 2
    Input Text    ${BILL_PAYMENT_AMOUNT_FIELD}    ${pay_amount}
    # Click the Confirm Button
    Click Button    ${BILL_PAYMENT_BTN}

    Sleep    2
    Wait Until Element Is Visible    ${PAYMENT_TARGET}
    # Check validationMessage Attribute of the Payment Target Choices
    ${validation_msg}    Get Element Attribute    ${PAYMENT_TARGET}/input[1]    validationMessage
    Should Be Equal As Strings    ${validation_msg}    Please select one of these options.

    Withdraw    ${WEB_URL}    ${amount}

TC58: Bill Payment with Amount = 0
    ${amount}    Set Variable    50
    Login    ${WEB_URL}    ${WEB_BROWSER}    ${ACCOUNT_NUMBER}    ${PASSWORD}
    Deposit    ${WEB_URL}    ${amount}

    Sleep    1
    Wait Until Page Contains Element    ${BILL_PAYMENT_CARD}

    # Select the Payment Target
    # Select From List By Value    ${PAYMENT_TARGET}    Electric Charge
    Click Element    ${PAYMENT_TARGET}/input[2]
    # Fill the Amount Field
    Input Text    ${BILL_PAYMENT_AMOUNT_FIELD}    0
    Click Button    ${BILL_PAYMENT_BTN}

    Sleep    2
    Wait Until Page Contains    Please put only number
    Withdraw    ${WEB_URL}    ${amount}

TC62: Bill Payment with Insufficient Balance
    ${amount}    Set Variable    50
    Login    ${WEB_URL}    ${WEB_BROWSER}    ${ACCOUNT_NUMBER}    ${PASSWORD}
    Deposit    ${WEB_URL}    ${amount}

    Sleep    1
    Wait Until Page Contains Element    ${BILL_PAYMENT_CARD}

    # Select the Payment Target
    # Select From List By Value    ${PAYMENT_TARGET}    Electric Charge
    Click Element    ${PAYMENT_TARGET}/input[2]
    # Fill the Amount Field
    ${pay_amount}    Evaluate    int(${amount}) + 1
    Input Text    ${BILL_PAYMENT_AMOUNT_FIELD}    ${pay_amount}
    Click Button    ${BILL_PAYMENT_BTN}

    Sleep    2
    Wait Until Page Contains    your balance isn't not enough
    Withdraw    ${WEB_URL}    ${amount}

TC63: Bill Payment with a Decimal Amount
    ${amount}    Set Variable    50
    Login    ${WEB_URL}    ${WEB_BROWSER}    ${ACCOUNT_NUMBER}    ${PASSWORD}
    Deposit    ${WEB_URL}    ${amount}

    Sleep    1
    Wait Until Page Contains Element    ${BILL_PAYMENT_CARD}

    # Select the Payment Target
    Click Element    ${PAYMENT_TARGET}/input[2]
    # Fill the Amount Field
    ${pay_amount}    Evaluate    int(${amount}) // 2 + 0.1
    Input Text    ${BILL_PAYMENT_AMOUNT_FIELD}    ${pay_amount}
    Click Button    ${BILL_PAYMENT_BTN}

    Sleep    2
    Wait Until Element Is Visible    ${BILL_PAYMENT_AMOUNT_FIELD}
    # Check validationMessage Attribute of the Payment Target Choices
    ${validation_msg}    Get Element Attribute    ${BILL_PAYMENT_AMOUNT_FIELD}    validationMessage

    ${lower_bound}    Evaluate    math.floor(${pay_amount})
    ${upper_bound}    Evaluate    math.ceil(${pay_amount})
    Should Be Equal
    ...    ${validation_msg}
    ...    Please enter a valid value. The two nearest valid values are ${lower_bound} and ${upper_bound}.

    Withdraw    ${WEB_URL}    ${amount}

TC64: Bill Payment with Empty Amount
    Login    ${WEB_URL}    ${WEB_BROWSER}    ${ACCOUNT_NUMBER}    ${PASSWORD}

    Sleep    1
    Wait Until Page Contains Element    ${BILL_PAYMENT_CARD}

    # Select the Payment Target
    Click Element    ${PAYMENT_TARGET}/input[2]
    Click Button    ${BILL_PAYMENT_BTN}

    Sleep    2
    Wait Until Element Is Visible    ${BILL_PAYMENT_AMOUNT_FIELD}
    # Check validationMessage Attribute of the Payment Target Choices
    ${validation_msg}    Get Element Attribute    ${BILL_PAYMENT_AMOUNT_FIELD}    validationMessage

    Should Be Equal    ${validation_msg}    Please fill out this field.
