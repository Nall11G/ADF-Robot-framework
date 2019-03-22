*** Settings ***
Documentation    Suite description
Library  SeleniumLibrary
Resource   ../TestCases/TestSuiteVariables.robot
#Resource   ../TestCases/TestSuiteVariables.robot

*** Variables ***
${Related_Address_Type_E}   xpath=.//*[@id='00Nf4000009hevs_ileinner']
${Related_Address_Mailing_Street_E}     xpath=.//*[@id='00Nf4000009hew6_ileinner']
${Related_Address_Mailing_City_E}       xpath=.//*[@id='00Nf4000009hew3_ileinner']
${Related_Address_Mailing_State_E}      xpath=.//*[@id='00Nf4000009hew5_ileinner']
${Related_Address_Mailing_Code_E}       xpath=.//*[@id='00Nf4000009hew7_ileinner']
${Related_Address_Mailing_Country_E}    xpath=.//*[@id='00Nf4000009hew4_ileinner']
${Related_Address_Contact_E}        xpath=.//*[@id='CF00Nf4000009henG_ileinner']
${Related_Address_DoNotMail_E}      xpath=.//*[@id='00Nf4000009hevu']
${Related_Address_MailOptOut_E}      xpath=.//*[@id='00Nf4000009hew2']
${Related_Address_OptOutDate_E}     xpath=.//*[@id='00Nf4000009hew1_ileinner']
${Edit_Button}      name=edit
${Make_Primary_Button}      name=make_primary
${View_Campiagn_Segments_Button}    name=view_campaign_segments
${Cancel}   name=cancel

*** Keywords ***

Get_Related_Address_Values

    ${RA_Address_Type}=   Get Text      ${Related_Address_Type_E}
    Set Global Variable   ${RA_Address_Type}
    ${RA_Street}=   Get Text    ${Related_Address_Mailing_Street_E}
    Set Global Variable  ${RA_Street}
    ${RA_City}=     Get Text    ${Related_Address_Mailing_City_E}
    Set Global Variable  ${RA_City}
    ${RA_State}=     Get Text    ${Related_Address_Mailing_State_E}
    Set Global Variable  ${RA_State}
    ${RA_Code}=     Get Text    ${Related_Address_Mailing_Code_E}
    Set Global Variable  ${RA_Code}
    ${RA_Country}=     Get Text    ${Related_Address_Mailing_Country_E}
    Set Global Variable  ${RA_Country}
    ${RA_OptOutDate}=     Get Text    ${Related_Address_OptOutDate_E}
    Set Global Variable   ${RA_OptOutDate}

Navigates_To_Cotact
    Click Element  xpath=.//a[contains(text(),'${ContactName_Value}')]

Get_Related_Address_Checkbox_Values

    Click Element  ${Edit_Button}
    ${RA_OptOut}=     Get Value    ${Related_Address_MailOptOut_E}
    Set Global Variable    ${RA_OptOut}
    ${RA_DonotMail}=    Get Value  ${Related_Address_DoNotMail_E}
    Set Global Variable  ${RA_DonotMail}
    Click Element  ${Cancel}

Make_Primary_Address

   Click Button  xpath=.//*[@id='bottomButtonRow']/input[6]
   Set Selenium Implicit Wait  10s
