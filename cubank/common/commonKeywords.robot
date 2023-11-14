*** Settings ***
Library     SeleniumLibrary
Resource    ../data/environment.robot


*** Keywords ***
Open Register Page
    Open Browser    ${WEB_URL}/register/    ${WEB_BROWSER}
    Maximize Browser Window

Register Success
    [Arguments]    ${accountId}    ${password}    ${firstName}    ${lastName}

    Input Text    name:accountId    ${accountId}
    Input Text    name:password    ${password}
    Input Text    name:firstName    ${firstName}
    Input Text    name:lastName    ${lastName}

    Click Button    //*[@id="root"]/div/div/div/form/button

    Alert Should Be Present    success    ACCEPT
