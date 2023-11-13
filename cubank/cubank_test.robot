*** Settings ***
Library    SeleniumLibrary
Test Teardown    Close All Browsers

*** Test Cases ***
Verify registration form with all input field
    [Tags]    All Input
    Open Browser    http://localhost:3000/    chrome
    Maximize Browser Window

    Input Text    //*[@id='accountId']    1111111111
    Input Text    //*[@id='password']    1111
    # Locate and Click the Login button
    Click Element    //*[@id="root"]/div/div/div/form/button
    # Wait Until Page Contains the Input Field of Deposit Card
    Wait Until Page Contains Element    //*[@id="root"]/div/div/div/div[3]/div[2]/form/label/input
    Input Text    //*[@id="root"]/div/div/div/div[3]/div[2]/form/label/input    1111.1
    # Click the Confirm Button
    Click Element    //*[@id="root"]/div/div/div/div[3]/div[2]/form/button
    sleep    10
