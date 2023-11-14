*** Settings ***
Library    SeleniumLibrary

Resource    ../common/commonKeywords.robot

Test Teardown    Close All Browsers

*** Test Cases ***
Verify registration form with all input field
    Login

    Input Text    //*[@id="root"]/div/div/div/div[3]/div[2]/form/label/input    1111.1
    # Click the Confirm Button
    Click Element    //*[@id="root"]/div/div/div/div[3]/div[2]/form/button
    sleep    10

