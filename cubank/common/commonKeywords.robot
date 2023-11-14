*** Settings ***
Library     SeleniumLibrary
Resource    ../data/environment.robot


*** Keywords ***
Open Login Page
    Open Browser    ${WEB_URL}/    ${WEB_BROWSER}
    Maximize Browser Window
