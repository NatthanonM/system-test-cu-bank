*** Settings ***
Library             SeleniumLibrary
Resource            ../data/environment.robot
Resource            ../common/page/accountpage.robot
Resource            ../common/page/homepage.robot
Resource            ../common/commonKeywords.robot

Suite Setup         Set Log Level    DEBUG
Test Teardown       Close All Browsers


*** Test Cases ***
# ------Deposit 1 TC26-------
Scenario10 test 1 login pass deposit pass transfer pass (TC16, TC26, TC38)
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
    Scroll To Top Of Page
    sleep    5

Scenario10 test 2 login pass deposit pass transfer pass (TC16, TC26, TC46)
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
    Scroll To Top Of Page
    sleep    5

Scenario10 test 3 login pass deposit pass transfer pass (TC16, TC26, TC47)
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
    Scroll To Top Of Page
    sleep    5

Scenario10 test 4 login pass deposit pass transfer pass (TC16, TC26, TC48)
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
    Scroll To Top Of Page
    sleep    5

Scenario10 test 5 login pass deposit pass transfer pass (TC16, TC26, TC49)
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
    Scroll To Top Of Page
    sleep    5

# ------Deposit 2 TC27-------

Scenario10 test 6 login pass deposit pass transfer pass (TC16, TC27, TC38)
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
    Scroll To Top Of Page
    sleep    5

Scenario10 test 7 login pass deposit pass transfer pass (TC16, TC27, TC46)
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
    Scroll To Top Of Page
    sleep    5

Scenario10 test 8 login pass deposit pass transfer pass (TC16, TC27, TC47)
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
    Scroll To Top Of Page
    sleep    5

Scenario10 test 9 login pass deposit pass transfer pass (TC16, TC27, TC48)
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
    Scroll To Top Of Page
    sleep    5

Scenario10 test 10 login pass deposit pass transfer pass (TC16, TC27, TC49)
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
    Scroll To Top Of Page
    sleep    5

# ------Deposit 3 TC28-------

Scenario10 test 11 login pass deposit pass transfer pass (TC16, TC28, TC38)
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
    Scroll To Top Of Page
    sleep    5

Scenario10 test 12 login pass deposit pass transfer pass (TC16, TC28, TC46)
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
    Scroll To Top Of Page
    sleep    5

Scenario10 test 13 login pass deposit pass transfer pass (TC16, TC28, TC47)
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
    Scroll To Top Of Page
    sleep    5

Scenario10 test 14 login pass deposit pass transfer pass (TC16, TC28, TC48)
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
    Scroll To Top Of Page
    sleep    5

Scenario10 test 1 login pass deposit pass transfer pass (TC16, TC28, TC49)
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
    Scroll To Top Of Page
    sleep    5
