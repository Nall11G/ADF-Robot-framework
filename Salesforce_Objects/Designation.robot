*** Settings ***
Documentation    Suite description
Library     Selenium2Library
Resource   ../TestCases/TestSuiteVariables.robot

*** Variables ***

${Object_Link}  https://adflegal--qarel.my.salesforce.com/a0P/o
${New_button_E}     name=new
${Designation_Name_E}   xpath=.//*[@id='Name']
${Active_Checkbox_E}    xpath=.//*[@id='00Nf4000009hesZ']
${Default_Checkbox_E}   xpath=.//*[@id='00Nf4000009hesZ']
${Save_button_E}    name=save
${Cancel_button_E}  name=cancel

# Verification Fields
${Designation_Name_Values_E}    xpath=.//*[@id='Name_ileinner']
${Active_Value_E}   xpath=.//*[@id='00Nf4000009hesZ_chkbox']
${Default_Value_E}  xpath=.//*[@id='00Nf4000009hesa_chkbox']
${Click_Here_Button}        xpath=.//input[@name="j_id0:j_id1:j_id28"]
${UsernameElement}      Id=username
${PasswordElement}      Id=password
${Submit}       Id=Login
${URL} =  https://test.salesforce.com





*** Keywords ***
Designation_Record_Creation

   Obejct_Selection
   Wait Until Element Is Visible  ${New_button_E}
   Click Element  ${New_button_E}
   Input Text  ${Designation_Name_E}    Test
   Click Element  ${Active_Checkbox_E}
   Click Element  ${Save_button_E}

Verifying_the_Desingation_Record_Deletion

   Click Element  name=del
   Alert Should Be Present
   Click Element    ${Click_Here_Button}

Designation_Record_Choose
    Wait Until Element Is Visible  ${New_button_E}
    Set Selenium Implicit Wait  5s
    Click Element  xpath=.//th/a[contains(.,"${DesignationName_V}")]

Obejct_Selection

    Sleep  10s
    Click Element  xpath=.//*[@id='AllTab_Tab']/a
    Wait Until Element Is Visible  xpath=.//a[contains(.,"Designations")]
    Click Element  xpath=.//a[contains(.,"Designations")]