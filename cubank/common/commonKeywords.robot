*** Setting ***
Resource     ../data/environment.robot


*** Keywords ***
Open browser cubank login page
    Open Browser    ${WEB_URL}    ${WEB_BROWSER}
    Maximize Browser Window
    Sleep    2

Wait cubank login page load complete
    Wait Until Element Contains    //*[@id="root"]/div/div/div/h2    ${login_header}


Input and verify account no
    Input text    //*[@id='accountId']    ${test_account_no} 
    ${account_no}    Get Value    //*[@id='accountId']
    Should Be Equal    ${account_no}    ${test_account_no}

Input and verify wrong account no
    Input text    //*[@id='accountId']    ${test_account_wrong} 
    ${account_wrong}    Get Value    //*[@id='accountId']
    Should Be Equal    ${account_wrong}    ${test_account_wrong}

Input and verify wrong_minneg account no
    Input text    //*[@id='accountId']    ${test_account_wrong_minneg} 
    ${account_wrong_minneg}    Get Value    //*[@id='accountId']
    Should Be Equal    ${account_wrong_minneg}    ${test_account_wrong_minneg}

Input and verify wrong_maxplus account no
    Input text    //*[@id='accountId']    ${test_account_wrong_maxplus} 
    ${account_wrong_maxplus}    Get Value    //*[@id='accountId']
    Should Be Equal    ${account_wrong_maxplus}    ${test_account_wrong_maxplus}

Input and verify account password
    Input text    //*[@id='password']    ${test_account_password} 
    ${account_password}    Get Value    //*[@id='password']
    Should Be Equal    ${account_password}    ${test_account_password}

Click login button
    Click Element  //*[@cid='lc']


Wait account page load complete
    Sleep    4
    Wait Until Element Contains    //*[@id="root"]/div/div/div/div/article/h2    ${account_header} 

Input and verify deposit min amount
    Input text    //*[@cid='d1']    ${test_deposit_min} 
    ${deposit_min}    Get Value    //*[@cid='d1']
    Should Be Equal    ${deposit_min}    ${test_deposit_min}

Input and verify deposit min_plus amount
    Input text    //*[@cid='d1']    ${test_deposit_minplus} 
    ${deposit_minplus}    Get Value    //*[@cid='d1']
    Should Be Equal    ${deposit_minplus}    ${test_deposit_minplus}

Input and verify deposit norm amount
    Input text    //*[@cid='d1']    ${test_deposit_norm} 
    ${deposit_norm}    Get Value    //*[@cid='d1']
    Should Be Equal    ${deposit_norm}    ${test_deposit_norm}

Click deposit button
    Click Element  //*[@cid='dc']

Input and verify withdraw min amount
    Input text    //*[@cid='w1']    ${test_withdraw_min} 
    ${withdraw_min}    Get Value    //*[@cid='w1']
    Should Be Equal    ${withdraw_min}    ${test_withdraw_min}

Input and verify withdraw min_plus amount
    Input text    //*[@cid='w1']    ${test_withdraw_minplus} 
    ${withdraw_minplus}    Get Value    //*[@cid='w1']
    Should Be Equal    ${withdraw_minplus}    ${test_withdraw_minplus}

Input and verify withdraw norm amount
    Input text    //*[@cid='w1']    ${test_withdraw_norm} 
    ${withdraw_norm}    Get Value    //*[@cid='w1']
    Should Be Equal    ${withdraw_norm}    ${test_withdraw_norm}

Input and verify withdraw max_neg amount
    Input text    //*[@cid='w1']    ${test_withdraw_maxneg} 
    ${withdraw_maxneg}    Get Value    //*[@cid='w1']
    Should Be Equal    ${withdraw_maxneg}    ${test_withdraw_maxneg}

Input and verify withdraw max amount
    Input text    //*[@cid='w1']    ${test_withdraw_max} 
    ${withdraw_max}    Get Value    //*[@cid='w1']
    Should Be Equal    ${withdraw_max}    ${test_withdraw_max}

Click withdraw button
    Click Element  //*[@cid='wc']

Verify error message
    Wait Until Element Contains    //*[@cid='login-error-mes']   ${test_data_error_message}

Verify error message minneg
    Wait Until Element Contains    //*[@cid='login-error-mes']   ${test_data_error_message_minneg}

Verify error message maxplus
    Wait Until Element Contains    //*[@cid='login-error-mes']   ${test_data_error_message_maxplus}

Input and verify transfer account
    Input text    //*[@cid='t1']    ${test_transfer_acc} 
    ${transfer_acc}    Get Value    //*[@cid='t1']
    Should Be Equal    ${transfer_acc}    ${test_transfer_acc}

Input and verify non-numerical transfer account 
    Input text    //*[@cid='t1']    ${test_non_numerical_transfer_acc} 
    ${transfer_acc}    Get Value    //*[@cid='t1']
    Should Be Equal    ${transfer_acc}    ${test_non_numerical_transfer_acc}

Input and verify transfer amount 
    Input text    //*[@cid='t2']    ${test_transfer_amount} 
    ${transfer_amount}    Get Value    //*[@cid='t2']
    Should Be Equal    ${transfer_amount}    ${test_transfer_amount}

Input and verify invalid transfer amount 
    Input text    //*[@cid='t2']    ${test_invalid_transfer_amount} 
    ${transfer_amount}    Get Value    //*[@cid='t2']
    Should Be Equal    ${transfer_amount}    ${test_invalid_transfer_amount}

Input and verify non-number transfer amount 
    Input text    //*[@cid='t2']    ${test_non_number_transfer_amount} 
    ${transfer_amount}    Get Value    //*[@cid='t2']
    Should Be Equal    ${transfer_amount}    ${test_non_number_transfer_amount}

Input and verify insufficient transfer amount
    Input text    //*[@cid='t2']    ${test_insufficient_transfer_amount} 
    ${transfer_amount}    Get Value    //*[@cid='t2']
    Should Be Equal    ${transfer_amount}    ${test_insufficient_transfer_amount}

Input and verify wrong-digit transfer account 
    Input text    //*[@cid='t1']    ${test_wrong_digit_transfer_acc} 
    ${transfer_acc}    Get Value    //*[@cid='t1']
    Should Be Equal    ${transfer_acc}    ${test_wrong_digit_transfer_acc}

Input and verify wrong-digit_maxplus transfer account
    Input text    //*[@cid='t1']    ${test_wrong_digit_maxplus_transfer_acc} 
    ${transfer_acc}    Get Value    //*[@cid='t1']
    Should Be Equal    ${transfer_acc}    ${test_wrong_digit_maxplus_transfer_acc}

Input and verify not found transfer account
    Input text    //*[@cid='t1']    ${test_not_found_transfer_acc} 
    ${transfer_acc}    Get Value    //*[@cid='t1']
    Should Be Equal    ${transfer_acc}    ${test_not_found_transfer_acc}

Input and verify same transfer account
    Input text    //*[@cid='t1']    ${test_same_transfer_acc} 
    ${transfer_acc}    Get Value    //*[@cid='t1']
    Should Be Equal    ${transfer_acc}    ${test_same_transfer_acc}

Verify transfer error message non-numeric account
    Wait Until Element Contains    //*[@cid='transfer-error-mes']   ${non_numerical_transfer_acc_errmsg}

Verify transfer error message wrong-digit account
    Wait Until Element Contains    //*[@cid='transfer-error-mes']   ${wrong_digit_transfer_acc_errmsg}

Verify transfer error message not found account
    Wait Until Element Contains    //*[@cid='transfer-error-mes']   ${not_found_transfer_acc_errmsg}

Verify transfer error message same account
    Wait Until Element Contains    //*[@cid='transfer-error-mes']   ${same_transfer_acc_errmsg}

Verify transfer error message invalid transfer amount 
    ${invalid_transfer_amount_errmsg}=    Get Element Attribute    //*[@id="root"]/div/div/div/div[5]/div[2]/form/div[2]/label/input    validationMessage
    Should Be Equal    ${invalid_transfer_amount_errmsg}    ${test_invalid_transfer_amount_errmsg}

Verify transfer error message non-number transfer amount
    Wait Until Element Contains    //*[@cid='transfer-error-mes']   ${non_number_transfer_errmsg}

Verify transfer error message insufficient transfer amount
    Wait Until Element Contains    //*[@cid='transfer-error-mes']   ${insufficient_transfer_errmsg}

Click transfer button
    Click Element  //*[@cid='tc']
