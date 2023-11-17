*** Setting ***
Resource    ../../../keywords/ui/common/commonKeywords.robot
Resource    ../../../testdata/environment.robot
Resource    ../../../testdata/test_data.robot

*** Keywords ***
Open browser CU bank login
    Open Browser    ${WEB_URL}    ${WEB_BROWSER}
    Maximize Browser Window
    Sleep    2

Wait CU bank login load complete
    Wait Until Element Is Visible    //button[@cid='lc']

Verify account number is empty
   ${accountNumber}    Get Value    //input[@name='accountId']
    Should Be Equal    ${accountNumber}    ${EMPTY}

Input and verify account number
    Input text    //input[@name='accountId']    ${test_data_account_number} 
    ${accountNumber}    Get Value    //input[@name='accountId']
    Should Be Equal    ${accountNumber}    ${test_data_account_number}

Input and verify password
    Input text    //input[@name='password']    ${test_data_password} 
    ${password}    Get Value    //input[@name='password']
    Should Be Equal    ${password}    ${test_data_password}   

Click login
    Click Element  //button[@cid='lc'] 