*** Settings ***
Documentation    Suite description
Library  SeleniumLibrary
Resource   ../TestCases/TestSuiteVariables.robot

*** Variables ***

${Object_Link}  https://adflegal--qarel.my.salesforce.com/a0b/o
${New_Button_E}   name=new
${RecordType_E}     xpath=.//*[@id='p3']
${Contniue/Save_E}   name=save
${First_Contact_E}     xpath=.//*[@id='CF00Nf4000009hewO']
${First_Account_E}      xpath= .//*[@id='CF00Nf4000009hewN']
${Priority_E}   xpath=.//*[@id='00N1b000000bKbN']
${First_Relationship_Type_E}    xpath=.//*[@id='CF00Nf4000009hewP']
${Second_Contact_E}     xpath=.//*[@id='CF00Nf4000009hewV']
${Second_Account_E}     xpath=.//*[@id='CF00Nf4000009hewU']
${Second_Relationship_Type_E}   xpath=.//*[@id='CF00Nf4000009hewW']
${Start_Date_E}     xpath=.//*[@id='00Nf4000009hewY']
${End_Date_E}       xpath=.//*[@id='00Nf4000009hewL']
${Second_SoftCredit_E}      xpath=.//*[@id='00Nf4000009hewK']
${First_SoftCredit_E}       xpath=.//*[@id='00Nf4000009hewJ']
${Cancel_E}     name=cancel
${Active_Checkbox_E}    xpath=.//*[@id='00Nf400000AILqu_chkbox']
${Edit_Button}      name=edit

#Verification Elements

${First_Account_Value_E}    xpath=.//*[@id='CF00Nf4000009hewN_ileinner']
${Second_Account_Value_E}   xpath=.//*[@id='CF00Nf4000009hewV_ileinner']
${First_Contact_Value_E}    xpath=.//*[@id='CF00Nf4000009hewO_ileinner']
${Second_Contact_Value_E}   xpath=.//*[@id='CF00Nf4000009hewV_ileinner']
${Priority_Value_E}     xpath=.//*[@id='00N1b000000bKbN_chkbox']
${First_Relationship_Value_E}   xpath=.//*[@id='CF00Nf4000009hewP_ileinner']
${Second_Relationship_Value_E}  xpath=.//*[@id='CF00Nf4000009hewW_ileinner']
${Start_Date_Value_E}   xpath=.//*[@id='00Nf4000009hewY_ilecell']
${End_Date_Value_E}     xpath=.//*[@id='00Nf4000009hewL_ileinner']




*** Keywords ***

Contact-Contact_Relationship_Type_Detail_Record_Creation

    Wait Until Element Is Visible  ${New_Button_E}
    Click Element  ${New_Button_E}
    Click Element  ${Contniue/Save_E}
    Input Text  ${First_Contact_E}      Kelly Hunter
    Input Text  ${Second_Contact_E}     QA8-Salutation
    Input Text  ${First_Relationship_Type_E}    Church Alliance Relationship
    Input Text  ${Second_Relationship_Type_E}   Church Alliance Relationship
    Input Text  ${Start_Date_E}     12/9/2018
    Click Element  ${Contniue/Save_E}



Obejct_Selection

    Click Element  xpath=.//*[@id='AllTab_Tab']/a/img
    Wait Until Element Is Visible  xpath=.//a[contains(.,"Relationship Type Details")]
    Click Element  xpath=.//a[contains(.,"Relationship Type Details")]

Account-Account_Relationship_Type_Detail_Record_Creation

    Wait Until Element Is Visible  ${New_Button_E}
    Click Element  ${New_Button_E}
    @{RecordType}=      Get List Items      ${RecordType_E}
    Select From List By Value   ${RecordType_E}      @{RecordType}[1]
    Click Element  ${Contniue/Save_E}
    Input Text   ${First_Account_E}     ${FirstAccount_V}
    Input Text  ${Second_Account_E}    ${SecondAccount_V}
    Input Text  ${First_Relationship_Type_E}    ${First_Relationship_V}
    Input Text  ${Second_Relationship_Type_E}   ${Second_Relationship_V}
    Input Text  ${Start_Date_E}     ${Start_Date_V}
    Click Element  ${Contniue/Save_E}

Account-Contact_Relationship_Type_Detail_Record_Creation

    Wait Until Element Is Visible  ${New_Button_E}
    Click Element  ${New_Button_E}
    @{RecordType}=      Get List Items      ${RecordType_E}
    Select From List By Value   ${RecordType_E}      @{RecordType}[2]
    Click Element  ${Contniue/Save_E}
    Input Text   ${First_Account_E}     ${FirstAccount_V}
    Input Text  ${Second_Contact_E}    ${SecondContact_V}
    Input Text  ${First_Relationship_Type_E}    Church Alliance Relationship
    Input Text  ${Second_Relationship_Type_E}   Church Alliance Relationship
    Input Text  ${Start_Date_E}     ${Start_Date_V}
    Click Element  ${Contniue/Save_E}

Verifying_Ative_Relationship
    Wait Until Element Is Visible   ${Start_Date_Value_E}
    ${DateValue}=   Get Value    ${Start_Date_Value_E}
    Set Global Variable  ${DateValue}
    Run Keyword If  ${DateValue}== ${EMPTY}     Checkbox_Verifucation

Checkbox_Verification
    Click Element  ${Edit_Button}
    ${Active}=      Run Keyword And Return Status  Checkbox Should Be Selected  xpath=.//*[@id='00Nf400000AILqu_chkbox']
    Log    ${Active}
    Click Element  ${Cancel_E}

Cancelling_the_Edit_Mode
    Capture Page Screenshot
    Click Element  ${Cancel_E}