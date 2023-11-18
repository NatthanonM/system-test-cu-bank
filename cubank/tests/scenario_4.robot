*** Settings ***
Library             SeleniumLibrary
Resource            ../data/environment.robot
Resource            ../common/page/accountpage.robot
Resource            ../common/page/homepage.robot
Resource            ../common/commonKeywords.robot

Suite Setup         Set Log Level    DEBUG
Test Teardown       Close All Browsers


*** Test Cases ***
S4.1: TC16 (login success), TC28 (deposit success min), TC39 (widthdraw failure not emough balance)
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

S4.2: TC16 (login success), TC28 (deposit success min+), TC39 (widthdraw failure not emough balance)
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

S4.3: TC16 (login success), TC28 (deposit success nom), TC39 (widthdraw failure not emough balance)
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