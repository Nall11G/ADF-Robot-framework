*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary
Library  selenium2screenshots

#Resource  ../Salesforce_Objects/Church_Signup.robot
Resource   ../TestCases/TestSuiteVariables.robot

*** Variables ***
${Edit_button}  name=edit
${Cancel_button}    name=cancel
${RecordType_V}   Household Contact
${Duplication_Status}
${Household_Contact}
${Applicant_Name}
# Field Verification WebElements
${Applicant_Obj}        xpath=.//*[@id='01rf4000000LqQr_Tab']/a
${Applicant_Name_E}     xpath=.//*[@id='Name_ileinner']
${Household_contact_E}        xpath=.//*[@id='CF00Nf400000AI7r0_ileinner']
${ODP_Contact_E}        xpath=.//*[@id='CF00Nf400000AI7r3_ileinner']
${Record_Type_E}        xpath=.//*[@id='RecordType_ileinner']
${Payment_Mode_E}       xpath=.//*[@id='00Nf400000AJWdu_ileinner']
${Payment_Type_E}       xpath=.//*[@id='00Nf400000AI7rd_ileinner']
${Applicant_Email_E}      xpath=.//*[@id='00Nf400000AI7qu_ileinner']
${Primary_Contact_E}       xpath=.//*[@id='00Nf400000AI7r4_ileinner']
${Applicant_Phone_E}       xpath=.//*[@id='00Nf400000AI7r4_ileinner']
${Duplication_Status_E}      xpath=.//*[@id='00Nf400000AI7qt_ileinner']
${Annual_Ministry_Revneue_E}        xpath=.//*[@id='00Nq0000001qDMD_ileinner']
${Payment_Verified_E}       xpath=.//*[@id='00Nf400000AI7rQ_ileinner']
${Attorney_FN_E}        xpath=.//*[@id='00Nq0000001qDMC_ileinner']
${Attorney_City_E}      xpath=.//*[@id='00Nq0000001qDM9_ileinner']
${Attorney_LN_E}        xpath=.//*[@id='00Nq0000001qDMA_ileinner']
${Attorney_State_E}     xpath=.//*[@id='00Nq0000001qDMB_ileinner']
${Applicant_FN_E}       xpath=.//*[@id='00Nf400000AI7qv_ileinner']
${Applicant_LN_E}       xpath=.//*[@id='00Nf400000AI7r1_ileinner']
${Title}        xpath=.//*[@id='00Nf400000AI7r6_ileinner']
${Ministry_Name_E}      xpath=.//*[@id='00Nq0000001qNbS_ileinner']
${Primary_Contact_Checkbox_E}     id=00Nf400000AI7r5
${Attoney_Checkbox_E}     id=00Nf400000O5A2Z

*** Keywords ***

Verifying_The_Primary_Applicant_Detail_record

    ${Applicant_Name}=      Get Text        ${Applicant_Name_E}
    Set Global Variable  ${Applicant_Name}
    ${Household_Contact}=   Get Text    ${Household_contact_E}
    Set Global Variable  ${Household_Contact}
    ${ODP_Contact}=   Get Text    xpath=.//*[@id='CF00Nf400000AI7r3_ileinner']
    Set Global Variable  ${ODP_Contact}
    ${Applicant_FirstName}=     Get Text    ${Applicant_FN_E}
    Set Global Variable  ${Applicant_FirstName}
    ${Applicant_LastName}=    Get Text  ${Applicant_LN_E}
    Set Global Variable  ${Applicant_LastName}
    ${Applicant_RecordType}=   Get Text    ${Record_Type_E}
    Set Global Variable  ${Applicant_RecordType}
    ${Applicant_Email}=   Get Text    ${Applicant_Email_E}
    Set Global Variable  ${Applicant_Email}
    ${Applicant_Phone}=   Get Text    ${Applicant_Phone_E}
    Set Global Variable  ${Applicant_Phone}
    ${Duplication_Status}=   Get Text    ${Duplication_Status_E}
    Set Global Variable  ${Duplication_Status}
    ${Primary_Contact}=   Get Text    ${Primary_Contact_E}
    Set Global Variable  ${Primary_Contact}
    Should Be Equal  ${Applicant_FirstName}    	${Primary_FirstName_V}
    Should Be Equal  ${Applicant_LastName}      ${Primary_LastName_V}
    Should Be Equal  ${Applicant_Phone}     ${Primary_Phone_V}
    Should Be Equal  ${Applicant_Email}     ${Primary_Email_V}
    Should Contain  ${Applicant_RecordType}    ${RecordType_V}
    Validating_The_Applicant_Detail(Primary)
    Verifying_The_Duplication_Stauts_Of_The_Applicant

Validating_The_Applicant_Detail(Primary)

    Click Element  ${Edit_button}
    ${Primary_Checkbox}=     Run Keyword And Return Status  checkbox should be selected   ${Primary_Contact_Checkbox_E}
    Set Global Variable  ${Primary_Checkbox}
    Should Be Equal   ${Primary_Checkbox}   ${True}
    ${Already_Attorney_Checkbox}=     Run Keyword And Return Status  checkbox should be selected   ${Attoney_Checkbox_E}
    Set Global Variable     ${Already_Attorney_Checkbox}
    Should Be Equal   ${Already_Attorney_Checkbox}   ${True}
    Click Element  ${Cancel_button}

Verifying_The_Duplication_Stauts_Of_The_Applicant

    Run Keyword If  "${Duplication_Status}"=="Contact Matched"     Household_Contact_Filed_Verification_Using_Duplication_Logic(ContactMatched)
    Run Keyword If  "${Duplication_Status}"=="No Existing Contact Found"   Household_Contact_Filed_Verification_Using_Duplication_Logic(NoMatchingContactFound)

Household_Contact_Filed_Verification_Using_Duplication_Logic(ContactMatched)
    Should Not Contain  ${Household_Contact}    ${Applicant_Name}

Household_Contact_Filed_Verification_Using_Duplication_Logic(NoMatchingContactFound)
    Should Contain  ${Household_Contact}    ${Applicant_Name}

Verifying_The_Secondary_Applicant_Detail_record

    ${Applicant_Name}=      Get Text        ${Applicant_Name_E}
    Set Global Variable  ${Applicant_Name}
    ${Household_Contact}=   Get Text    ${Household_contact_E}
    Set Global Variable  ${Household_Contact}
    ${ODP_Contact}=   Get Text    ${ODP_Contact_E}
    Set Global Variable  ${ODP_Contact}
    ${Applicant_FirstName}=     Get Text    ${Applicant_FN_E}
    Set Global Variable  ${Applicant_FirstName}
    ${Applicant_LastName}=    Get Text  ${Applicant_LN_E}
    Set Global Variable  ${Applicant_LastName}
    ${Applicant_RecordType}=   Get Text    ${Record_Type_E}
    Set Global Variable  ${Applicant_RecordType}
    ${Applicant_Email}=   Get Text    ${Applicant_Email_E}
    Set Global Variable  ${Applicant_Email}
    ${Applicant_Phone}=   Get Text    ${Applicant_Phone_E}
    Set Global Variable  ${Applicant_Phone}
    ${Duplication_Status}=   Get Text    ${Duplication_Status_E}
    Set Global Variable  ${Duplication_Status}
    ${Primary_Contact}=   Get Text    ${Primary_Contact_E}
    Set Global Variable  ${Primary_Contact}
    Should Be Equal  ${Applicant_FirstName}     ${Lead_FirstName_V}
    Should Be Equal  ${Applicant_LastName}      ${Lead_LastName_V}
    Should Be Equal  ${Applicant_Phone}     ${Lead_Phone_V}
    Should Be Equal  ${Applicant_Email}     ${Lead_Email_V}
    Should Be Equal  ${Applicant_RecordType}    ${RecordType_V}
    #Validating_The_Applicant_Detail(Primary)
    Verifying_The_Duplication_Stauts_Of_The_Applicant

Verifying_The_Lead/Primary_Applicant_Detail_record

    ${Applicant_Name}=      Get Text        ${Applicant_Name_E}
    Set Global Variable  ${Applicant_Name}
    ${Household_Contact}=   Get Text    ${Household_contact_E}
    Set Global Variable  ${Household_Contact}
    ${ODP_Contact}=   Get Text    ${ODP_Contact_E}
    Set Global Variable  ${ODP_Contact}
    ${Applicant_FirstName}=     Get Text    ${Applicant_FN_E}
    Set Global Variable  ${Applicant_FirstName}
    ${Applicant_LastName}=    Get Text  ${Applicant_LN_E}
    Set Global Variable  ${Applicant_LastName}
    ${Applicant_RecordType}=   Get Text    ${Record_Type_E}
    Set Global Variable  ${Applicant_RecordType}
    ${Applicant_Email}=   Get Text    ${Applicant_Email_E}
    Set Global Variable  ${Applicant_Email}
    ${Applicant_Phone}=   Get Text    ${Applicant_Phone_E}
    Set Global Variable  ${Applicant_Phone}
    ${Duplication_Status}=   Get Text    ${Duplication_Status_E}
    Set Global Variable  ${Duplication_Status}
    ${Primary_Contact}=   Get Text    ${Primary_Contact_E}
    Set Global Variable  ${Primary_Contact}
    Should Be Equal  ${Applicant_FirstName}     ${Lead_FirstName_V}
    Should Be Equal  ${Applicant_LastName}      ${Lead_LastName_V}
    Should Be Equal  ${Applicant_Phone}     ${Lead_Phone_V}
    Should Be Equal  ${Applicant_Email}     ${Lead_Email_V}
    Should Be Equal  ${Applicant_RecordType}    ${RecordType_V}
    Validating_The_Applicant_Detail(Primary)
    Verifying_The_Duplication_Stauts_Of_The_Applicant

Household_Contact_Selection_Primary
    Click Element  xpath=.//h2[contains(.,"Applicant Detail")]/following::div/a[contains(text(),'${Household_Contact}')]
    Wait Until Element Is Visible  ${Edit_button}

Household_Contact_Selection_Lead/Secondary
    Click Element  xpath=.//h2[contains(.,"Applicant Detail")]/following::div/a[contains(text(),'${Lead_FirstName_V}')]
    Wait Until Element Is Visible  ${Edit_button}

Duplicates_Applicant's_HouseholdContact
    Click Element  xpath=.//a[Contains(.,"${Household}"]
    Wait Until Element Is Visible  ${Edit_button}

Test_QA
     Should Contain  TestQA2    ${RecordType_V}

Verifying The Exception
     Run Keyword And Return  Test_QA    Capture Element Screenshot