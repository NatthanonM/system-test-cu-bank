*** Settings ***
Library     SeleniumLibrary
Resource    ../commonKeywords.robot
Resource    ../../data/environment.robot


*** Keywords ***
Wait deposit feature load complete
    Wait Until Element Is Visible    //button[@cid='dc']

Wait widthdraw feature load complete
    Wait Until Element Is Visible    //button[@cid='wc']

Wait transfer feature load complete
    Wait Until Element Is Visible    //button[@cid='tc']

Input deposit 1
    Input text    //input[@cid='d1']    ${test_data_deposit_1}

Input deposit 2
    Input text    //input[@cid='d1']    ${test_data_deposit_2}

Input deposit 10
    Input text    //input[@cid='d1']    ${test_data_deposit_10}

Input widthdraw with same amount of balance
    Input Text    //input[@cid='w1']    ${balance}

Input widthdraw with exceed amount of balance
    ${exceed_balance}=    Evaluate    ${balance} + 1
    Input Text    //input[@cid='w1']    ${exceed_balance}

Input widthdraw with not integer
    Input Text    //input[@cid='w1']    ${test_data_withdraw_not_int}

Input widthdraw with zero number
    Input Text    //input[@cid='w1']    0

Input transfer target account id
    Input Text    //input[@cid='t1']    ${test_data_transfer_target_account_id}

Input transfer 1
    Input Text    //input[@cid='t2']    ${test_data_transfer_1}

Input transfer 2
    Input Text    //input[@cid='t2']    ${test_data_transfer_2}

Input transfer 24
    Input Text    //input[@cid='t2']    ${test_data_transfer_24}

Input transfer 25
    Input Text    //input[@cid='t2']    ${test_data_transfer_25}

Click confirm deposit
    Click Element    //button[@cid='dc']

Click confirm widthdraw
    Click Element    //button[@cid='wc']

Click confirm transfer
    Click Element    //button[@cid='tc']

Check balance
    ${balance}=    Get Text    //h2[contains(text(), 'Balance:')]/following-sibling::h1[1]
    ${balance}=    Convert To Integer    ${balance}
    Log To Console    The Balance is: ${balance}
    Set Global Variable    ${balance}

Check widthdraw error response
    Wait Until Element Is Visible    //label[@cid="withdraw-error-mes"]
    ${error_message}=    Get Text    //label[@cid="withdraw-error-mes"]
    Should Be Equal    ${error_message}    ${test_data_error_message}

Predefine set balance to 15
    Wait widthdraw feature load complete
    ${balance}=    Set Variable    15
    Set Global Variable    ${balance}
    Predefine add balnce calculation
    Predefine check criterion

Predefine set balance to 23
    Wait widthdraw feature load complete
    ${balance}=    Set Variable    23
    Set Global Variable    ${balance}
    Predefine add balnce calculation
    Predefine check criterion

Predefine set balance to 24
    Wait widthdraw feature load complete
    ${balance}=    Set Variable    24
    Set Global Variable    ${balance}
    Predefine add balnce calculation
    Predefine check criterion

Predefine set balance to 40
    Wait widthdraw feature load complete
    ${balance}=    Set Variable    40
    Set Global Variable    ${balance}
    Predefine add balnce calculation
    Predefine check criterion

Predefine set balance to 48
    Wait widthdraw feature load complete
    ${balance}=    Set Variable    48
    Set Global Variable    ${balance}
    Predefine add balnce calculation
    Predefine check criterion

Predefine set balance to 49
    Wait widthdraw feature load complete
    ${balance}=    Set Variable    49
    Set Global Variable    ${balance}
    Predefine add balnce calculation
    Predefine check criterion

Predefine add balnce calculation
    Log To Console    The Balance is: ${balance}
    ${current_balance}=    Get Text    //h2[contains(text(), 'Balance:')]/following-sibling::h1[1]
    ${current_balance}=    Convert To Integer    ${current_balance}
    ${add_balance}=    Evaluate    ${balance} - ${current_balance}
    Set Global Variable    ${add_balance}
    Log To Console    Deposit/Withdraw is: ${add_balance}

Predefine check criterion
    IF    ${add_balance} > 0
        Predefine deposit balance
    ELSE IF    ${add_balance} == 0
        Predefine nothing
    ELSE
        Predefine withdraw balance
    END

Predefine deposit balance
    Input Text    //input[@cid='d1']    ${add_balance}
    Log    Depositing balance: ${add_balance}
    Click Element    //button[@cid='dc']

Predefine withdraw balance
    ${abs_balance}=    Evaluate    abs(${add_balance})
    Input Text    //input[@cid='w1']    ${abs_balance}
    Log    Withdrawing balance: ${abs_balance}
    Click Element    //button[@cid='wc']

Predefine nothing
    IF    ${add_balance} == 0    Log To Console    No need to deposit/withdraw

Scroll To Top Of Page
    Wait deposit feature load complete
    Execute JavaScript    window.scrollTo(0, 0)
