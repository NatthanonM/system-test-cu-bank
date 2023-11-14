*** Settings ***
Library             SeleniumLibrary
Resource            ../common/commonKeywords.robot
Resource            ../data/environment.robot

Test Setup          Open Login Page
Test Teardown       Close All Browsers


*** Test Cases ***
TC17
    Input Text    name:accountId    5555555555
    Input Text    name:password    1234

    Click Button    //*[@id="root"]/div/div/div/form/button

    Wait Until Element Contains    //*[@id="root"]/div/div/div/form/label[2]/div/label    Not Found User

TC18
    Input Text    name:accountId    501234567
    Input Text    name:password    1989

    Click Button    //*[@id="root"]/div/div/div/form/button

    Wait Until Element Contains
    ...    //*[@id="root"]/div/div/div/form/label[2]/div/label
    ...    Please fill accountId 10 digits

TC19
    Input Text    name:accountId    50123456789
    Input Text    name:password    1989

    Click Button    //*[@id="root"]/div/div/div/form/button

    Wait Until Element Contains
    ...    //*[@id="root"]/div/div/div/form/label[2]/div/label
    ...    Please fill accountId 10 digits

TC20
    Input Text    name:accountId    5012345678X
    Input Text    name:password    1989

    Click Button    //*[@id="root"]/div/div/div/form/button

    Wait Until Element Contains
    ...    //*[@id="root"]/div/div/div/form/label[2]/div/label
    ...    Please put accountId only number

TC21
    Input Text    name:accountId    50123456789
    Input Text    name:password    198

    Click Button    //*[@id="root"]/div/div/div/form/button

    Wait Until Element Contains
    ...    //*[@id="root"]/div/div/div/form/label[2]/div/label
    ...    Please fill password 4 digits

TC22
    Input Text    name:accountId    50123456789
    Input Text    name:password    19890

    Click Button    //*[@id="root"]/div/div/div/form/button

    Wait Until Element Contains
    ...    //*[@id="root"]/div/div/div/form/label[2]/div/label
    ...    Please fill password 4 digits

TC23
    Input Text    name:accountId    50123456789
    Input Text    name:password    1989X

    Click Button    //*[@id="root"]/div/div/div/form/button

    Wait Until Element Contains
    ...    //*[@id="root"]/div/div/div/form/label[2]/div/label
    ...    Please put password only number

TC24
    Input Text    name:accountId    5012345678
    Input Text    name:password    1234

    Click Button    //*[@id="root"]/div/div/div/form/button

    Wait Until Element Contains
    ...    //*[@id="root"]/div/div/div/form/label[2]/div/label
    ...    Password Incorrect
