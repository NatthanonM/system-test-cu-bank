*** Settings ***
Library     SeleniumLibrary
Resource    ../data/environment.robot


*** Keywords ***
Register
    [Arguments]    ${accountId}    ${password}    ${firstName}    ${lastName}
    Open Browser    ${WEB_URL}/register/    ${WEB_BROWSER}
    Maximize Browser Window

    Input Text    name:accountId    ${accountId} 
    Input Text    name:password    ${password}
    Input Text    name:firstName    ${firstName}
    Input Text    name:lastName    ${lastName}

    Click Button    //*[@id="root"]/div/div/div/form/button

    Alert Should Be Present    success    ACCEPT    3000