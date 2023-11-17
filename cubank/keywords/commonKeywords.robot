*** Settings ***
Library    SeleniumLibrary
Resource    ../testdata/environment.robot

*** Keywords ***
Register 
    [Arguments]    ${account_number}    ${password}    ${first_name}    ${last_name}    ${have_first_name}=${True}    ${have_last_name}=${True}
    Open Browser    ${WEB_URL}/register    ${WEB_BROWSER}
    Maximize Browser Window

    Input Text    //*[@id='accountId']    ${account_number}
    Input Text    //*[@id='password']    ${password}
    IF    ${have_first_name}
        Input Text    //*[@id='firstName']    ${first_name}
    END
    IF    ${have_last_name}
        Input Text    //*[@id='lastName']    ${last_name}
    END
    Click Element    //*[@cid='rc']