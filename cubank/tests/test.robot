*** Settings ***
Library             SeleniumLibrary
Resource            ../common/commonKeywords.robot

Test Teardown       Close All Browsers


*** Test Cases ***
Registration success
    [Template]    Register
    5012345678    1989    Taylor    Swift
    5123456789    1989    T    S
    5234567890    1989    Tounubhu    Sosaelf
    5345678901    1989    Tnoerradneleotmiehzi    Sraoteil
    5456789012    1989    Tulxahasdamistasteno    Soatgotbe
