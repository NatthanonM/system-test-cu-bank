*** Settings ***
Library             SeleniumLibrary
Resource            ../common/commonKeywords.robot

Test Teardown       Close All Browsers


*** Test Cases ***
TC16: Successful login and Go to account page
    Open browser cubank login page
    Wait cubank login page load complete
    Input and verify account no
    Input and verify account password
    Click login button
    Wait account page load complete

TC28: Successful Deposit (with min), Update database and Refresh page
    Open browser cubank login page
    Wait cubank login page load complete
    Input and verify account no
    Input and verify account password
    Click login button
    Wait account page load complete
    Input and verify deposit min amount
    Click deposit button
    Reload Page

TC29: Successful Deposit (with min+), Update database and Refresh page
    Open browser cubank login page
    Wait cubank login page load complete
    Input and verify account no
    Input and verify account password
    Click login button
    Wait account page load complete
    Input and verify deposit min_plus amount
    Click deposit button
    Reload Page

TC30: Successful Deposit (with norm), Update database and Refresh page
    Open browser cubank login page
    Wait cubank login page load complete
    Input and verify account no
    Input and verify account password
    Click login button
    Wait account page load complete
    Input and verify deposit norm amount
    Click deposit button
    Reload Page

TC34: Successful Withdraw (with min), Update database and Refresh page
    Open browser cubank login page
    Wait cubank login page load complete
    Input and verify account no
    Input and verify account password
    Click login button
    Wait account page load complete
    Input and verify withdraw min amount
    Click withdraw button
    Reload Page

TC35: Successful Withdraw (with min+), Update database and Refresh page
    Open browser cubank login page
    Wait cubank login page load complete
    Input and verify account no
    Input and verify account password
    Click login button
    Wait account page load complete
    Input and verify withdraw min_plus amount
    Click withdraw button
    Reload Page

TC36: Successful Withdraw (with norm), Update database and Refresh page
    Open browser cubank login page
    Wait cubank login page load complete
    Input and verify account no
    Input and verify account password
    Click login button
    Wait account page load complete
    Input and verify withdraw norm amount
    Click withdraw button
    Reload Page

TC37: Successful Withdraw (with max-), Update database and Refresh page
    Open browser cubank login page
    Wait cubank login page load complete
    Input and verify account no
    Input and verify account password
    Click login button
    Wait account page load complete
    Input and verify withdraw max_neg amount
    Click withdraw button
    Reload Page

TC38: Successful Withdraw (with max), Update database and Refresh page
    Open browser cubank login page
    Wait cubank login page load complete
    Input and verify account no
    Input and verify account password
    Click login button
    Wait account page load complete
    Input and verify withdraw max amount
    Click withdraw button
    Reload Page

TC41: Transfer Account Number is not number
    Open browser cubank login page
    Wait cubank login page load complete
    Input and verify account no
    Input and verify account password
    Click login button
    Wait account page load complete
    Input and verify non-numerical transfer account
    Input and verify transfer amount
    Click transfer button
    Verify transfer error message non-numeric account

TC42: Transfer Account No. digit is not equal to 10 (max-)
    Open browser cubank login page
    Wait cubank login page load complete
    Input and verify account no
    Input and verify account password
    Click login button
    Wait account page load complete
    Input and verify wrong-digit transfer account
    Input and verify transfer amount
    Click transfer button
    Verify transfer error message wrong-digit account

TC43: Transfer Account No. digit is not equal to 10 (max+)
    Open browser cubank login page
    Wait cubank login page load complete
    Input and verify account no
    Input and verify account password
    Click login button
    Wait account page load complete
    Input and verify wrong-digit_maxplus transfer account
    Input and verify transfer amount
    Click transfer button
    Verify transfer error message wrong-digit account

TC44: Transfer target Account is not found.
    Open browser cubank login page
    Wait cubank login page load complete
    Input and verify account no
    Input and verify account password
    Click login button
    Wait account page load complete
    Input and verify not found transfer account
    Input and verify transfer amount
    Click transfer button
    Verify transfer error message not found account

TC45: Cannot Transfer to your own account.
    Open browser cubank login page
    Wait cubank login page load complete
    Input and verify account no
    Input and verify account password
    Click login button
    Wait account page load complete
    Input and verify same transfer account
    Input and verify transfer amount
    Click transfer button
    Verify transfer error message same account

TC46: Transfer amount is invalid value (not integer).
    Open browser cubank login page
    Wait cubank login page load complete
    Input and verify account no
    Input and verify account password
    Click login button
    Wait account page load complete
    Input and verify transfer account
    Input and verify invalid transfer amount
    Click transfer button
    Verify transfer error message invalid transfer amount

TC47: Transfer amount is invalid value (min-).
    Open browser cubank login page
    Wait cubank login page load complete
    Input and verify account no
    Input and verify account password
    Click login button
    Wait account page load complete
    Input and verify transfer account
    Input and verify non-number transfer amount
    Click transfer button
    Verify transfer error message non-number transfer amount

TC52: Transfer balance is not enough (max+).
    Open browser cubank login page
    Wait cubank login page load complete
    Input and verify account no
    Input and verify account password
    Click login button
    Wait account page load complete
    Input and verify transfer account
    Input and verify insufficient transfer amount
    Click transfer button
    Verify transfer error message insufficient transfer amount
