*** Settings ***
Documentation    Suite description
Library  SeleniumLibrary
Resource   ../TestCases/TestSuiteVariables.robot


*** Variables ***

${Campaign_Segmenr_Name_E}      xpath=.//*[@id='Name']
${Campaign_E}   xpath=.//*[@id='CF00Nf4000009hen9']
${Channel_E}        xpath=.//*[@id='00Nf4000009heoa']
${SubChannel_E}     xpath=.//*[@id='00Nf4000009heou']
${New_Button_E}     name=new
${Save}     name=save
${Edit_Button}      name=edit
${SourceCode_VE}    xpath=.//*[@id='00Nf4000009heot_ileinner']
${Previous_Sourcecode}

*** Keywords ***

Campaign_Segment_Record_Creation

    Wait Until Element Is Visible  ${New_Button_E}
    Click Element  ${New_Button_E}
    Input Text  ${Campaign_Segmenr_Name_E}   ${Campaign_Segment_Name_V}
    Input Text  ${Campaign_E}   ${Campaign_V}
    @{Channel}=      Get List Items  ${Channel_E}
    Select From List By Value  ${Channel_E}     @{Channel}[2]
    @{SubChannel}=      Get List Items  ${SubChannel_E}
    Select From List By Value  ${SubChannel_E}    @{SubChannel}[2]
    Click Element  ${Save}


Obejct_Selection

    Click Element  xpath=.//*[@id='AllTab_Tab']/a/img
    Wait Until Element Is Visible  xpath=.//a[contains(.,"Relationship Type Details")]
    Click Element  xpath=.//a[contains(.,"Campaign Segments")]


Verfiying_the_Sourcecode_Value

    Wait Until Element Is Visible   ${Edit_Button}
    ${SourceCode}=      Get Text    ${SourceCode_VE}
    Log To Console
    ${Expected_Sourcecode}=     evaluate  ${Previous_Sourcecode} + 1
    Log To Console
    Should Be Equal   ${SourceCode}      ${Expected_Sourcecode}
