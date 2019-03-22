*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary
Resource   ../TestCases/TestSuiteVariables.robot
#Resource  ../Salesforce_Objects/Church_Signup.robot
Resource  ../Common_Configuration/Common_Configure.robot



*** Variables ***


#Field verification Webelements
${Membership_obj}       xpath=.//*[@id='01rf4000000LqQt_Tab']/a
${Memebership_Name_E}     xpath=.//*[@id='CF00Nf400000AI7re']
${ODP_contact_E}        xpath=.//*[@id='CF00Nf400000AI7rf']
${Record_Type_E}        xpath=.//*[@id='RecordType_ileinner']
${Payment_Mode_E}       xpath=.//*[@id='00Nf400000AJWdu_ileinner']
${Payment_Type_E}       xpath=.//*[@id='00Nf400000AI7rd_ileinner']
${Membsership_Email_E}      xpath=.//*[@id='00Nf400000AI7rS']
${Membership_Price_E}       xpath=.//*[@id='CF00Nf400000AI7rc']
${StartDate_E}      xpath=.//*[@id='00Nf400000AI7ri']
${Applicant_Name_E}     xpath=.//*[@id='00Nf400000AI7rW']
${Annual_Ministry_Revneue_E}        xpath=.//*[@id='00Nq0000001qDMD_ileinner']
${Payment_Verified_E}       xpath=.//*[@id='00Nf400000AI7rg']
${Promo_Code_E}      xpath=.//*[@id='CF00Nf400000AJWdv']
${Payment_Declined_E}   xpath=.//*[@id='00Nf400000AI7rh']
${Membership_Approval_E}    xpath=.//*[@id='00Nf400000AI7rQ']
${Membership_Detail_Record}     xpath=.//span[contains(.,'${ChurchName_V}')]/preceding::td/div/a[Contains(.,"MDN")]


*** Keywords ***

Verifying_The_Successful_Membership_Detail_Record

    ${Membership}=  Get Text   ${Memebership_Name_E}
    Set Global Variable  ${Membership}
    ${Organization_Contact}=    Get Text    ${ODP_contact_E}
    Set Global Variable  ${Organization_Contact}
    ${Email}=   Get Text  ${Membsership_Email_E}
    Set Global Variable  ${Email}
    ${Payment_Verifyed}=   Run Keyword And Return Status  checkbox should be selected   ${Payment_Verified_E}
    Set Global Variable  ${Payment_Verifyed}

Verifying_The_Successful_Membership_Detail_Record




Membership_Record_selection

    Obejct_Selection
    Click Element  name=go
    Set Selenium Implicit Wait  10s
    Click Element  ${Membership_Detail_Record}
    Wait Until Element Is Visible  ${Memebership_Name_E}

