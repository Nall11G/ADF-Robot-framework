*** Settings ***
Documentation    Suite description
Library     Selenium2Library
Resource   ../TestCases/TestSuiteVariables.robot


*** Variables ***

${UsernameElement}      Id=username
${PasswordElement}      Id=password
${Submit}       Id=Login
${URL} =  https://test.salesforce.com
${Obj_Selection}    xpath=xpath=.//*[@id='AllTab_Tab']/a
@{Signup}       https://qarel-adflegalv2.cs92.force.com/payment/CA_MembershipJoin_VF    https://test.salesforce.com

#Yopmail verification

${Email_Search_Box}     xpath=.//*[@id='login']
${Inbox_Submit}     type=submit
${Check_New_Emails}     xpath=.//*[@id='lrefr']


*** Test Cases ***

TC1
    Open Browser  https://www.google.com/   chrome
    Set Selenium Implicit Wait  10s
    Email_Verification_Church_Alliance

*** Keywords ***
Log_into_Salesforce
    Open Browser  ${URL}    chrome
    Maximize Browser Window
    Input Text  ${UsernameElement}      nallavan@mstsolutions.com.qarel
    Input Text  ${PasswordElement}      metasoft@123
    click button  ${Submit}

Close_Driver
    close browser

Close_All_Browser_window
    close all browsers

Obejct_Selection

    Sleep  10s
    Click Element  ${Obj_Selection}
    Wait Until Element Is Visible  xpath=.//a[contains(.,"${ObjectName}")]
    Click Element  xpath=.//a[contains(.,"${ObjectName}")]

Church_Alliance_Login
    : FOR    ${i}    IN     @{Signup}
    \    Log    ${i}


Email_Verification_Church_Alliance

    Maximize Browser Window
    Press Key   id=lst-ib  Ctrl+Shift+N
    Select Window

Window_Handler_Donation_Role

    ${FirstWindow}=    Get Title
    Log To Console    ${FirstWindow}
    Click Element    ${Contact_Role_Table_E}
    ${Row Count}=    Get Matching Xpath Count    ${Contact_Role_Table_E}/tr
    : FOR    ${i}    IN RANGE    1    ${Row Count}+1
    \    Log    ${i}
    \    ${Getvalue}=    Get Text    ${Contact_Role_Table_E}/tr[${i}]/th
    \    Log    ${Getvalue}
    \    Run Keyword If    "${Getvalue}"=="${Role_Txt}"   Click Link  ${Contact_Role_Table_E}/tr[${i}]/th
    \    Run Keyword If    "${Getvalue}"=="${Role_Txt}"   Close Window
    \    Exit For Loop If    "${Getvalue}"=="${Role_Txt}"
    Select Window  ${Parent_Window_E}
    Set Selenium Implicit Wait  10s