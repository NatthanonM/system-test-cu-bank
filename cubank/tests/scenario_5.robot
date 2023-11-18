*** Settings ***
Library             SeleniumLibrary
Resource            ../common/commonKeywords.robot

Test Teardown       Close All Browsers


*** Test Cases ***
S5.1: TC16 (Successful login), TC29 (Successful Deposit min+), TC34 (Successful Withdraw min), TC41 (Transfer Account Number is not number)
    Open browser cubank login page
    Wait cubank login page load complete
    Input and verify account no
    Input and verify account password
    Click login button
    Sleep    1
    Wait account page load complete
    Input and verify deposit min_plus amount
    Click deposit button
    Sleep    1
    Input and verify withdraw min amount
    Click withdraw button
    Sleep    1
    Input and verify non-numerical transfer account
    Input and verify transfer amount
    Click transfer button
    Sleep    0.5
    Verify transfer error message non-numeric account

S5.2: TC16 (Successful login), TC30 (Successful Deposit norm), TC35 (Successful Withdraw min+), TC42 (Transfer Account No. digit is not equal to 10 max-)
    Open browser cubank login page
    Wait cubank login page load complete
    Input and verify account no
    Input and verify account password
    Click login button
    Sleep    1
    Wait account page load complete
    Input and verify deposit norm amount
    Click deposit button
    Sleep    1
    Input and verify withdraw min_plus amount
    Click withdraw button
    Sleep    1
    Input and verify wrong-digit transfer account
    Input and verify transfer amount
    Click transfer button
    Sleep    0.5
    Verify transfer error message wrong-digit account

S5.3: TC16 (Successful login), TC30 (Successful Deposit norm), TC36 (Successful Withdraw norm), TC43 (Transfer Account No. digit is not equal to 10 max+)
    Open browser cubank login page
    Wait cubank login page load complete
    Input and verify account no
    Input and verify account password
    Click login button
    Sleep    1
    Wait account page load complete
    Input and verify deposit norm amount
    Click deposit button
    Sleep    1
    Input and verify withdraw norm amount
    Click withdraw button
    Sleep    1
    Input and verify wrong-digit_maxplus transfer account
    Input and verify transfer amount
    Click transfer button
    Sleep    0.5
    Verify transfer error message wrong-digit account

S5.4: TC16 (Successful login), TC30 (Successful Deposit norm), TC37 (Successful Withdraw max-), TC44 (Transfer target Account is not found)
    Open browser cubank login page
    Wait cubank login page load complete
    Input and verify account no
    Input and verify account password
    Click login button
    Sleep    1
    Wait account page load complete
    Input and verify deposit norm amount
    Click deposit button
    Sleep    1
    Input and verify withdraw max amount
    Click withdraw button
    Sleep    1
    Input and verify wrong-digit_maxplus transfer account
    Input and verify transfer amount
    Click transfer button
    Sleep    0.5
    Verify transfer error message wrong-digit account

S5.5: TC16 (Successful login), TC30 (Successful Deposit norm), TC38 (Successful Withdraw max), TC45 (Cannot Transfer to your own account)
    Open browser cubank login page
    Wait cubank login page load complete
    Input and verify account no
    Input and verify account password
    Click login button
    Sleep    1
    Wait account page load complete
    Input and verify deposit norm amount
    Click deposit button
    Sleep    1
    Input and verify withdraw max amount
    Click withdraw button
    Sleep    1
    Input and verify wrong-digit_maxplus transfer account
    Input and verify transfer amount
    Click transfer button
    Sleep    0.5
    Verify transfer error message wrong-digit account

S5.6: TC16 (Successful login), TC30 (Successful Deposit norm), TC38 (Successful Withdraw max), TC46 (Transfer balance is not enough max+)
    Open browser cubank login page
    Wait cubank login page load complete
    Input and verify account no
    Input and verify account password
    Click login button
    Sleep    1
    Wait account page load complete
    Input and verify deposit norm amount
    Click deposit button
    Sleep    1
    Input and verify withdraw max amount
    Click withdraw button
    Sleep    1
    Input and verify transfer account
    Input and verify invalid transfer amount
    Click transfer button
    Sleep    0.5
    Verify transfer error message invalid transfer amount

S5.7: TC16 (Successful login), TC30 (Successful Deposit norm), TC38 (Successful Withdraw max), TC47 (Transfer amount is invalid value min-)
    Open browser cubank login page
    Wait cubank login page load complete
    Input and verify account no
    Input and verify account password
    Click login button
    Sleep    1
    Wait account page load complete
    Input and verify deposit norm amount
    Click deposit button
    Sleep    1
    Input and verify withdraw max amount
    Click withdraw button
    Sleep    1
    Input and verify transfer account
    Input and verify non-number transfer amount
    Click transfer button
    Sleep    0.5
    Verify transfer error message non-number transfer amount

S5.8: TC16 (Successful login), TC30 (Successful Deposit norm), TC38 (Successful Withdraw max), TC52 (Transfer balance is not enough max+)
    Open browser cubank login page
    Wait cubank login page load complete
    Input and verify account no
    Input and verify account password
    Click login button
    Sleep    1
    Wait account page load complete
    Input and verify deposit norm amount
    Click deposit button
    Sleep    1
    Input and verify withdraw max amount
    Click withdraw button
    Sleep    1
    Input and verify transfer account
    Input and verify insufficient transfer amount
    Click transfer button
    Sleep    0.5
    Verify transfer error message insufficient transfer amount
