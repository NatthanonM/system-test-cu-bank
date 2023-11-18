*** Settings ***
Library             SeleniumLibrary
Resource            ../data/environment.robot
Resource            ../common/page/accountpage.robot
Resource            ../common/page/homepage.robot
Resource            ../common/commonKeywords.robot

Suite Setup         Set Log Level    DEBUG
Test Teardown       Close All Browsers


*** Test Cases ***
S10.1: TC16 (login success), TC28 (deposit success min), TC40 (transfer success nom)
    [Tags]    valid
    Open browser CU bank login
    Wait CU bank login load complete
    Input and verify account number
    Input and verify password
    Click login
    Predefine set balance to 49
    Wait deposit feature load complete
    Input deposit 1
    Click confirm deposit
    Wait transfer feature load complete
    Input transfer target account id
    Input transfer 25
    Click confirm transfer

S10.2: TC16 (login success), TC28 (deposit success min), TC48 (transfer success min)
    [Tags]    valid
    Open browser CU bank login
    Wait CU bank login load complete
    Input and verify account number
    Input and verify password
    Click login
    Predefine set balance to 24
    Wait deposit feature load complete
    Input deposit 1
    Click confirm deposit
    Wait transfer feature load complete
    Input transfer target account id
    Input transfer 1
    Click confirm transfer

S10.3: TC16 (login success), TC28 (deposit success min), TC49 (transfer success min+)
    [Tags]    valid
    Open browser CU bank login
    Wait CU bank login load complete
    Input and verify account number
    Input and verify password
    Click login
    Predefine set balance to 24
    Wait deposit feature load complete
    Input deposit 1
    Click confirm deposit
    Wait transfer feature load complete
    Input transfer target account id
    Input transfer 2
    Click confirm transfer

S10.4: TC16 (login success), TC28 (deposit success min), TC50 (transfer success max-)
    [Tags]    valid
    Open browser CU bank login
    Wait CU bank login load complete
    Input and verify account number
    Input and verify password
    Click login
    Predefine set balance to 24
    Wait deposit feature load complete
    Input deposit 1
    Click confirm deposit
    Wait transfer feature load complete
    Input transfer target account id
    Input transfer 24
    Click confirm transfer

S10.5: TC16 (login success), TC28 (deposit success min), TC51 (transfer success max)
    [Tags]    valid
    Open browser CU bank login
    Wait CU bank login load complete
    Input and verify account number
    Input and verify password
    Click login
    Predefine set balance to 24
    Wait deposit feature load complete
    Input deposit 1
    Click confirm deposit
    Wait transfer feature load complete
    Input transfer target account id
    Input transfer 25
    Click confirm transfer

S10.6: TC16 (login success), TC29 (deposit success min+), TC40 (transfer success nom)
    [Tags]    valid
    Open browser CU bank login
    Wait CU bank login load complete
    Input and verify account number
    Input and verify password
    Click login
    Predefine set balance to 48
    Wait deposit feature load complete
    Input deposit 2
    Click confirm deposit
    Wait transfer feature load complete
    Input transfer target account id
    Input transfer 25
    Click confirm transfer

S10.7: TC16 (login success), TC29 (deposit success min+), TC48 (transfer success min)
    [Tags]    valid
    Open browser CU bank login
    Wait CU bank login load complete
    Input and verify account number
    Input and verify password
    Click login
    Predefine set balance to 23
    Wait deposit feature load complete
    Input deposit 2
    Click confirm deposit
    Wait transfer feature load complete
    Input transfer target account id
    Input transfer 1
    Click confirm transfer

S10.8: TC16 (login success), TC29 (deposit success min+), TC49 (transfer success min+)
    [Tags]    valid
    Open browser CU bank login
    Wait CU bank login load complete
    Input and verify account number
    Input and verify password
    Click login
    Predefine set balance to 23
    Wait deposit feature load complete
    Input deposit 2
    Click confirm deposit
    Wait transfer feature load complete
    Input transfer target account id
    Input transfer 2
    Click confirm transfer

S10.9: TC16 (login success), TC29 (deposit success min+), TC50 (transfer success max-)
    [Tags]    valid
    Open browser CU bank login
    Wait CU bank login load complete
    Input and verify account number
    Input and verify password
    Click login
    Predefine set balance to 23
    Wait deposit feature load complete
    Input deposit 2
    Click confirm deposit
    Wait transfer feature load complete
    Input transfer target account id
    Input transfer 24
    Click confirm transfer

S10.10: TC16 (login success), TC29 (deposit success min+), TC51 (transfer success max)
    [Tags]    valid
    Open browser CU bank login
    Wait CU bank login load complete
    Input and verify account number
    Input and verify password
    Click login
    Predefine set balance to 23
    Wait deposit feature load complete
    Input deposit 2
    Click confirm deposit
    Wait transfer feature load complete
    Input transfer target account id
    Input transfer 25
    Click confirm transfer


S10.11: TC16 (login success), TC30 (deposit success nom), TC40 (transfer success nom)
    [Tags]    valid
    Open browser CU bank login
    Wait CU bank login load complete
    Input and verify account number
    Input and verify password
    Click login
    Predefine set balance to 40
    Wait deposit feature load complete
    Input deposit 10
    Click confirm deposit
    Wait transfer feature load complete
    Input transfer target account id
    Input transfer 25
    Click confirm transfer

S10.12: TC16 (login success), TC30 (deposit success nom), TC48 (transfer success min-)
    [Tags]    valid
    Open browser CU bank login
    Wait CU bank login load complete
    Input and verify account number
    Input and verify password
    Click login
    Predefine set balance to 15
    Wait deposit feature load complete
    Input deposit 10
    Click confirm deposit
    Wait transfer feature load complete
    Input transfer target account id
    Input transfer 1
    Click confirm transfer

S10.13: TC16 (login success), TC30 (deposit success nom), TC49 (transfer success min)
    [Tags]    valid
    Open browser CU bank login
    Wait CU bank login load complete
    Input and verify account number
    Input and verify password
    Click login
    Predefine set balance to 15
    Wait deposit feature load complete
    Input deposit 10
    Click confirm deposit
    Wait transfer feature load complete
    Input transfer target account id
    Input transfer 2
    Click confirm transfer

S10.14: TC16 (login success), TC30 (deposit success nom), TC50 (transfer success max-)
    [Tags]    valid
    Open browser CU bank login
    Wait CU bank login load complete
    Input and verify account number
    Input and verify password
    Click login
    Predefine set balance to 15
    Wait deposit feature load complete
    Input deposit 10
    Click confirm deposit
    Wait transfer feature load complete
    Input transfer target account id
    Input transfer 24
    Click confirm transfer

S10.15: TC16 (login success), TC30 (deposit success nom), TC51 (transfer success max)
    [Tags]    valid
    Open browser CU bank login
    Wait CU bank login load complete
    Input and verify account number
    Input and verify password
    Click login
    Predefine set balance to 15
    Wait deposit feature load complete
    Input deposit 10
    Click confirm deposit
    Wait transfer feature load complete
    Input transfer target account id
    Input transfer 25
    Click confirm transfer