*** Setting ***
Resource    ../../../keywords/ui/common/commonKeywords.robot
Resource    ../../../testdata/environment.robot
Resource    ../../../testdata/test_data.robot

*** Keywords ***
Wait deposit feature load complete
    Wait Until Element Is Visible    //button[@cid='dc']

Wait widthdraw feature load complete
    Wait Until Element Is Visible    //button[@cid='wc']

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

Click confirm deposit
    Click Element  //button[@cid='dc']

Click confirm widthdraw
    Click Element  //button[@cid='wc']

Check balance
    ${balance}=    Get Text    //h2[contains(text(), 'Balance:')]/following-sibling::h1[1]
    ${balance}=    Convert To Integer    ${balance}
    Log To Console    The Balance is: ${balance}
    Set Global Variable    ${balance}

Check widthdraw error response
    Wait Until Element Is Visible    //label[@cid="withdraw-error-mes"]
    ${error_message}    Get Text    //label[@cid="withdraw-error-mes"]
     Should Be Equal    ${error_message}    ${test_data_error_message}