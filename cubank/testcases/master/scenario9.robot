*** Settings ***
Library    SeleniumLibrary
Suite Setup    Set Log Level    DEBUG
Resource    ../../testdata/environment.robot
Resource    ../../keywords/ui/page/homepage.robot
Resource    ../../keywords/ui/page/accountpage.robot
Test Teardown    Close All Browsers

*** Test Cases ***
Scenario9 test 1 widthdraw with not integer (TC16, TC26, TC30)
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

Scenario9 test 2 widthdraw with not integer (TC16, TC27, TC30)
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
    Input widthdraw with not integer
    Click confirm widthdraw
    sleep    5

Scenario9 test 2 widthdraw with not integer (TC16, TC28, TC30)
    [Tags]    valid
    Open browser CU bank login
    Wait CU bank login load complete
    Input and verify account number
    Input and verify password
    Click login
    Wait deposit feature load complete
    Input deposit 10
    Click confirm deposit
    Wait widthdraw feature load complete
    Check balance
    Input widthdraw with not integer
    Click confirm widthdraw
    sleep    5

Scenario9 test 4 widthdraw with not integer (TC16, TC26, TC31)
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
    Input widthdraw with zero number
    Click confirm widthdraw
    sleep    5

Scenario9 test 5 widthdraw with not integer (TC16, TC27, TC31)
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
    Input widthdraw with zero number
    Click confirm widthdraw
    sleep    5

Scenario9 test 6 widthdraw with not integer (TC16, TC28, TC31)
    [Tags]    valid
    Open browser CU bank login
    Wait CU bank login load complete
    Input and verify account number
    Input and verify password
    Click login
    Wait deposit feature load complete
    Input deposit 10
    Click confirm deposit
    Wait widthdraw feature load complete
    Check balance
    Input widthdraw with zero number
    Click confirm widthdraw
    sleep    5

    