*** Settings ***
Library    SeleniumLibrary
Suite Setup    Set Log Level    DEBUG
Resource    ../../testdata/environment.robot
Resource    ../../keywords/ui/page/homepage.robot
Resource    ../../keywords/ui/page/accountpage.robot
Test Teardown    Close All Browsers

*** Test Cases ***
Scenario4 test 1 widthdraw with same amout of balance (T16, TC26)
    [Tags]    valid
    Open browser CU bank login
    Wait CU bank login load complete
    Input and verify account number
    Input and verify password
    Click login
    Wait deposit feature load complete
    Input deposit 1
    Click confirm deposit
    Wait widthdraw feature load complete
    Check balance
    Input widthdraw with same amount of balance
    Click confirm widthdraw
    sleep    5

Scenario4 test 2 widthdraw with exceed amout of balance (T16, TC26, TC37)
    [Tags]    valid
    Open browser CU bank login
    Wait CU bank login load complete
    Input and verify account number
    Input and verify password
    Click login
    Wait deposit feature load complete
    Input deposit 1
    Click confirm deposit
    Wait widthdraw feature load complete
    Check balance
    Input widthdraw with exceed amount of balance
    Click confirm widthdraw
    Check widthdraw error response
    sleep    5

Scenario4 test 3 widthdraw with exceed amout of balance (T16, TC27, TC37)
    [Tags]    valid
    Open browser CU bank login
    Wait CU bank login load complete
    Input and verify account number
    Input and verify password
    Click login
    Wait deposit feature load complete
    Input deposit 2
    Click confirm deposit
    Wait widthdraw feature load complete
    Check balance
    Input widthdraw with exceed amount of balance
    Click confirm widthdraw
    Check widthdraw error response
    sleep    5

Scenario4 test 4 widthdraw with exceed amout of balance (T16, TC28, TC37)
    [Tags]    valid
    Open browser CU bank login
    Wait CU bank login load complete
    Input and verify account number
    Input and verify password
    Click login
    Wait deposit feature load complete
    Input deposit 2
    Click confirm deposit
    Wait widthdraw feature load complete
    Check balance
    Input widthdraw with exceed amount of balance
    Click confirm widthdraw
    Check widthdraw error response
    sleep    5

Scenario4 test 5 widthdraw with not integer (T16, TC26, TC30)
    [Tags]    valid
    Open browser CU bank login
    Wait CU bank login load complete
    Input and verify account number
    Input and verify password
    Click login
    Wait deposit feature load complete
    Input deposit 1
    Click confirm deposit
    Wait widthdraw feature load complete
    Check balance
    Input widthdraw with not integer
    Click confirm widthdraw
    sleep    5

    