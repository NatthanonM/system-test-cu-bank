*** Settings ***
Library             SeleniumLibrary
Resource            ../data/environment.robot
Resource            ../common/page/accountpage.robot
Resource            ../common/page/homepage.robot
Resource            ../common/commonKeywords.robot

Suite Setup         Set Log Level    DEBUG
Test Teardown       Close All Browsers


*** Test Cases ***
S9.1: TC16 (login success), TC28 (deposit success min), TC32 (widthdraw failure input not integer)
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

S9.2: TC16 (login success), TC29 (deposit success min+), TC32 (widthdraw failure input not integer)
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

S9.3: TC16 (login success), TC30 (deposit success nom), TC32 (widthdraw failure input not integer)
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

S9.4: TC16 (login success), TC28 (deposit success min), TC33 (widthdraw failure input not number min-)
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

S9.5: TC16 (login success), TC29 (deposit success min+), TC33 (widthdraw failure input not number min-)
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

S9.6: TC16 (login success), TC29 (deposit success nom), TC33 (widthdraw failure input not number min-)
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
