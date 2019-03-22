*** Settings ***
Documentation    Suite description
Library  SeleniumLibrary
Resource   ../TestCases/TestSuiteVariables.robot

*** Variables ***
${Related_Email_Name_E}     xpath=.//*[@id='Name_ileinner']
${Related_Email_Status_E}   xpath=.//*[@id='00Nf4000009hewF_ileinner']
${Related_Email_Optout_Date_E}      xpath=.//*[@id='00Nf4000009hewE_ileinner']
${RelatedEmai_Opt_out_E}   xpath=.//*[@id='00Nf4000009hewD']
${RE_DoNot_Email_E}      xpath=.//*[@id='00Nf4000009hewC']
${Edit_Button}  name=edit


*** Keywords ***

Get_Values_From_RelatedEmail

    Wait Until Element Is Visible  ${Edit_Button}
    ${RE_Email}     Get Text  ${Related_Email_Name_E}
    Set Global Variable   ${RE_Email}
    ${RE_Status}     Get Text  ${Related_Email_Status_E}
    Set Global Variable   ${RE_Status}
    Click Element  xpath=.//a[contains(text(),'${ContactName_Value}')]