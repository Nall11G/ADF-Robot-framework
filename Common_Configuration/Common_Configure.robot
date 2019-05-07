*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary
Resource   ../TestCases/TestSuiteVariables.robot
#Library    ../Common_Configuration/PythonPropertyReader.py
#Variables    Configfile.robot
Resource  Configfile.robot

#Variables  PythonPropertyReader.py  CONFIG  /tmp/Config.ini
#Variables  Reader.py    CONFIG      config.ini
#Variables       config.ini

*** Variables ***

${UsernameElement}      Id=username
${PasswordElement}      Id=password
${Submit}       Id=Login
${Obj_Selection}    xpath=xpath=.//*[@id='AllTab_Tab']/a
@{Signup}       https://qarel-adflegalv2.cs92.force.com/payment/CA_MembershipJoin_VF    https://test.salesforce.com
@{BROWSERS}      Chrome      Firefox
#${CONFIG.${En}.SF.URL}
#${CONFIG.${En}.SF.Username}
#${CONFIG.${En}.SF.Password}
${BROWSER}
#Yopmail verification

${Email_Search_Box}     xpath=.//*[@id='login']
${Inbox_Submit}     type=submit
${Check_New_Emails}     xpath=.//*[@id='lrefr']
${UserName_Creation}    Sandbox: Create your Church Alliance Username & Password

*** Keywords ***

Log_into_Salesforce


    #Log  ${URL}
    #${Username}=    Get Variable Value     ${config.QAENV_SF.Username}
    #${Password}=    Get Variable Value     ${config.QAENV_SF.Password}
    Open Browser  ${URL.${ENVIRONMENT}}   ${BROWSER}
    Maximize Browser Window
    Input Text  ${UsernameElement}  ${username.${ENVIRONMENT}}
    Input Text  ${PasswordElement}  ${password.${ENVIRONMENT}}
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


Email_Verification

    Open Browser  http://www.yopmail.com/en/   chrome
    Maximize Browser Window
    Input Text  ${Email_Search_Box}     lonnie
    Click Element   xpath=.//input[@value="Check Inbox"]
    Wait Until Element Is Visible   xpath=.//*[@id='login']
    #Select Frame  id=ifc
    Select Frame  id=ifinbox
    Element Text Should Be   xpath=.//span[Contains(., "Sandbox: Create your Church Alliance Username & Password")]     ${UserName_Creation}
    Close Browser

Switch to Lightning
    Wait Until Element Is Visible  xpath=//div[@id='userNavButton']
    Click Element  xpath=//div[@id='userNavButton']
    Click Element  xpath=//a[@title='Switch to Lightning Experience']


