*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary
Resource   ../TestCases/TestSuiteVariables.robot
#Library     ../CustomLibrary/Testbrowser.py


*** Variables ***

${UsernameElement}      Id=username
${PasswordElement}      Id=password
${Submit}       Id=Login
${URL} =  https://test.salesforce.com
${Obj_Selection}    xpath=xpath=.//*[@id='AllTab_Tab']/a
@{Signup}       https://qarel-adflegalv2.cs92.force.com/payment/CA_MembershipJoin_VF    https://test.salesforce.com
${BROWSER}      Chrome

#Yopmail verification

${Email_Search_Box}     xpath=.//*[@id='login']
${Inbox_Submit}     type=submit
${Check_New_Emails}     xpath=.//*[@id='lrefr']
${UserName_Creation}    Sandbox: Create your Church Alliance Username & Password


*** Keywords ***
Log_into_Salesforce
    Open Browser  ${URL}    Chrome
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



Email

    Open Browser  http://www.yopmail.com/en/   chrome
    Maximize Browser Window
    Input Text  ${Email_Search_Box}     lonnie
    Click Element   xpath=.//input[@value="Check Inbox"]
    Wait Until Element Is Visible   xpath=.//*[@id='login']
    #Select Frame  id=ifc
    Select Frame  id=ifinbox
    Element Text Should Be   xpath=.//span[Contains(., "Sandbox: Create your Church Alliance Username & Password")]     ${UserName_Creation}
    Close Browser


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
