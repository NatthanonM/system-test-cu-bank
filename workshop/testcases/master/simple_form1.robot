*** Settings ***
Library    SeleniumLibrary
Test Teardown    Close All Browsers

*** Test Cases ***
Verify registration form with all input field
    [Tags]    All Input
    Open Browser    https://form.jotform.com/212934779973474    chrome
    Maximize Browser Window

    Input Text    //*[@id='input_48']    username
    Input Text    //*[@id='input_49']    password
    Select From List By Index    //*[@id='input_3']    1
    Input Text    //*[@id='input_14']    studentID
    Input Text    //*[@id='input_27_full']    1234567890
    Input Text    //*[@id='input_6']    test@mail.com
    Click Element    //*[@id='label_input_51_0']
    Click Element    //*[@id='form-pagebreak-next_76']
    Wait Until Element Contains    //*[@id='header_1']    Your registration has been completed
    sleep    10

    #Input firstname
    Wait Until Element Contains    //*[@id='header_1']    Student Registration Form
    Input text    //*[@id='input_48']    studentFirstName
    ${firstname}=    Get Value    //*[@id='input_48']
    Should Be Equal    ${firstname}    studentFirstName
