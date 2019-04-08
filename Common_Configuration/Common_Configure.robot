*** Settings ***
Documentation    Suite description
Library     Selenium2Library


*** Variables ***

${UsernameElement}      Id=username
${PasswordElement}      Id=password
${Submit}       Id=Login
${URL} =  https://test.salesforce.com
${Browser}  firefox


*** Keywords ***
Log_into_Salesforce
    Open Browser  ${URL}    ${Browser}
    Maximize Browser Window
    Input Text  ${UsernameElement}      nallavan@mstsolutions.com.qarel
    Input Text  ${PasswordElement}      metasoft@123
    click button  ${Submit}

Close_Driver
    close browser

Close_All_Browser_window
    close all browsers


