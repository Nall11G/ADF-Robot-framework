*** Settings ***
Documentation    ADF Project Reliance Features Regresstion Test Suite
Library  SeleniumLibrary
Library  Screenshot
#Library  pabot.PabotLib
Resource  ../Common_Configuration/Common_Configure.robot
Resource  ../Salesforce_Objects/Contact.robot
Resource  ../Salesforce_Objects/Account.robot
Resource  ../Salesforce_Objects/Donation.robot
Resource  ../Salesforce_Objects/Relationship_Type_Detail.robot
Resource  ../Salesforce_Objects/Campaign_Segment.robot
Resource  ../Salesforce_Objects/Designation.robot
Resource  ../Salesforce_Objects/RelatedAddress.robot
Resource  ../Salesforce_Objects/RelatedEmail.robot
Library     ../CustomLibrary/ExcelUtilities.py
#Library   ../CustomLibrary/EmailVerification.py
#Variables   TestSuiteVariables.robot
Resource   TestSuiteVariables.robot
#Resource    ../TestCases/TestSuiteVariables.robot
#Suite Setup     Log_into_Salesforce
#Suite Setup     Log_into_Salesforce


*** Variables ***
${HoH_Error_Alert}    The Head of Household flag should be true for this Contact record!!!
${Contact_Tab}  Id=Contact_Tab
${Opportunity_Tab_E}    xpath=.//*[@id='Opportunity_Tab']/a
${DonorContactRole}    Donor
${Email}    Id=con15
${Related_Email_E}  xpath=.//*[@id='Name_ileinner']
${Related_Email_Update}     nallavan7@yopmail.com
${Related_Address_E}    xpath=.//*[@id='00Nf4000009hew6_ileinner']
${Cancel}         name=cancel


*** Test Cases ***
ADF_REL-01
    [Tags]  
    1
    [Documentation]    *Functionality*
    ...    To Verify the household contact creation
    ...
    ...    *Test Steps*
    ...
    ...    1. Open the sandbox "test.salesforce.com"
    ...    2. Enter the valid username and password
    ...    3. Click ""Submit"" button
    ...    4. Navigates to "Donation" object
    ...    5. Click new button and then choose the record type
    ...    6. Click continue button
    ...    7. Choose the donor and account name and then enter the donation record details
    ...    8.Click save button
    ...    9. Scroll down to donation contact role VF page section
    ...    10. Click Edit contact roles button on VF page
    ...    11. Verfiy the expected result"
    ...
    ...    *Expected Result*
    ...
    ...    11.1 Donation contact role record should be created with name of Donor and the amount field should be updates as "Full"
    ...    11.2 New \ soft credit contact role record should \ be created \ from the donor's relaitionship viwer VF page

    #TestCase
    ${Browser}=     read_excel_data  Contact     ADF_REL-01    Browser
    Set Global Variable  ${Browser}
    ${FirstName_V}=    read_excel_data  Contact     ADF_REL-01    FirstName
    Set Global Variable   ${FirstName_V}
    ${LastName_V}=    read_excel_data  Contact      ADF_REL-01    LastName
    Set Global Variable      ${LastName_V}
    ${Salutation_V}=    read_excel_data  Contact      ADF_REL-01    Salutation
    Set Global Variable   ${Salutation_V}
    ${NickName_V}=    read_excel_data  Contact      ADF_REL-01     NickName
    Set Global Variable   ${NickName_V}
    ${SpouseName_V1}=  read_excel_data  Contact     ADF_REL-01     SpouseName
    Set Global Variable  ${SpouseName_V1}
    ${Mail_Street_V}=  read_excel_data  Contact     ADF_REL-01     MailingStreet
    Set Global Variable  ${Mail_Street_V}
    ${Mail_City_V}=   read_excel_data  Contact     ADF_REL-01     MailingCity
    set global variable  ${Mail_City_V}
    ${Mail_State_V}=  read_excel_data  Contact     ADF_REL-01     MailingState
    set global variable  ${Mail_State_V}
    ${Mail_Code_V}=   read_excel_data  Contact     ADF_REL-01     MailingZipCode
    set global variable  ${Mail_Code_V}
    ${Mail_Country_V}=    read_excel_data  Contact     ADF_REL-01    MailingCountry
    set global variable  ${Mail_Country_V}
    ${Contact_Email_V}=   read_excel_data  Contact     ADF_REL-01     Email
    set global variable  ${Contact_Email_V}
    Log_into_Salesforce
    Contact Creation With Salutation
    Set Selenium Implicit Wait  15s
    Verifying_Greeting_Field_Value
    Should Be Equal  ${Greeting_Value}  ${FirstName_V}
    Close Browser


ADF_REL-02
    [Tags]  DemoQA1
    [Documentation]    *Functionality*
    ...    To check whether the "Greeting" field value is updated or not,  when a user creating the
    ...    household contact record with "Salutation"   field value

    ...    *Test Steps*
    ...
    ...    1. Open the sandbox "test.salesforce.com"
    ...    2. Enter the valid username and password
    ...    3. Click ""Submit"" button
    ...    4. Navigates to "Contacy" object
    ...    5. Click new button and then choose the record type
    ...    6. Click continue button
    ...    7. Enter the contact record details and Enter the values in the Salutation field
    ...    8. Click save button
    ...    9. Verfiy the expected result"
    ...
    ...    *Expected Result*
    ...
    ...    9.1 The "Greeting" field value should be updated as  " Mr Test 8 Aug_28"

    #TestCase
    ${Browser}=     read_excel_data  Contact     ADF_REL-02    Browser
    Set Global Variable  ${Browser}
    ${FirstName_V}=    read_excel_data  Contact     ADF_REL-02     FirstName
    Set Global Variable   ${FirstName_V}
    ${LastName_V}=    read_excel_data  Contact      ADF_REL-02    LastName
    Set Global Variable     ${LastName_V}
    ${Salutation_V}=    read_excel_data  Contact      ADF_REL-02    Salutation
    Set Global Variable   ${Salutation_V}
    ${NickName_V}=    read_excel_data  Contact      ADF_REL-02   NickName
    Set Global Variable   ${NickName_V}
    ${SpouseName_V}=  read_excel_data  Contact     ADF_REL-02    SpouseName
    Set Global Variable  ${SpouseName_V}
    ${Mail_Street_V}=  read_excel_data  Contact     ADF_REL-02     MailingStreet
    Set Global Variable  ${Mail_Street_V}
    ${Mail_City_V}=   read_excel_data  Contact     ADF_REL-02    MailingCity
    set global variable  ${Mail_City_V}
    ${Mail_State_V}=  read_excel_data  Contact     ADF_REL-02     MailingState
    set global variable  ${Mail_State_V}
    ${Mail_Code_V}=   read_excel_data  Contact     ADF_REL-02     MailingZipCode
    set global variable  ${Mail_Code_V}
    ${Mail_Country_V}=    read_excel_data  Contact     ADF_REL-02     MailingCountry
    set global variable  ${Mail_Country_V}
    ${Contact_Email_V}=   read_excel_data  Contact     ADF_REL-02     Email
    set global variable  ${Contact_Email_V}
    ${Birth_Date_V}   read excel data     Contact     ADF_REL-02     BirthDate
    set global variable  ${Birth_Date_V}
    Log_into_Salesforce
    Contact Creation With Salutation
    Set Selenium Implicit Wait  15s
    Verifying_Greeting_Field_Value
    Should Be Equal  ${Greeting_Value}  ${Greeting_String1}
    Capture Page Screenshot
    Close Browser


ADF_REL-03

    [Tags]  DemoQA
    [Documentation]    *Functionality*
    ...    To check whether the "Greeting" field value is updated or not,  when a user creating the household contact record
    ...

    ...    *Test Steps*
    ...
    ...    1. Open the sandbox "test.salesforce.com"
    ...    2. Enter the valid username and password
    ...    3. Click ""Submit"" button
    ...    4. Navigates to "Contacy" object
    ...    5. Click new button and then choose the record type
    ...    6. Click continue button
    ...    7. Enter the contact record details
    ...    8. Click save button
    ...    9. Verfiy the expected result"
    ...
    ...    *Expected Result*
    ...
    ...    9.1 The "Greeting" field value should be updated as "Friend"

    #TestCase
    ${Browser}=     read_excel_data  Contact     ADF_REL-03    Browser
    Set Global Variable  ${Browser}
    ${FirstName_V}=    read_excel_data  Contact     ADF_REL-03     FirstName
    Set Global Variable   ${FirstName_V}
    ${LastName_V}=    read_excel_data  Contact      ADF_REL-03    LastName
    Set Global Variable     ${LastName_V}
    ${Salutation_V}=    read_excel_data  Contact      ADF_REL-03    Salutation
    Set Global Variable   ${Salutation_V}
    ${NickName_V}=    read_excel_data  Contact      ADF_REL-03    NickName
    Set Global Variable   ${NickName_V}
    ${SpouseName_V}=  read_excel_data  Contact     ADF_REL-03    SpouseName
    Set Global Variable  ${SpouseName_V}
    ${Mail_Street_V}=  read_excel_data  Contact     ADF_REL-03     MailingStreet
    Set Global Variable  ${Mail_Street_V}
    ${Mail_City_V}=   read_excel_data  Contact     ADF_REL-03    MailingCity
    set global variable  ${Mail_City_V}
    ${Mail_State_V}=  read_excel_data  Contact     ADF_REL-03     MailingState
    set global variable  ${Mail_State_V}
    ${Mail_Code_V}=   read_excel_data  Contact     ADF_REL-03     MailingZipCode
    set global variable  ${Mail_Code_V}
    ${Mail_Country_V}=    read_excel_data  Contact     ADF_REL-03     MailingCountry
    set global variable  ${Mail_Country_V}
    ${Contact_Email_V}=   read_excel_data  Contact     ADF_REL-03     Email
    set global variable  ${Contact_Email_V}
    ${Birth_Date_V}   read excel data     Contact     ADF_REL-03     BirthDate
    set global variable  ${Birth_Date_V}
    Log_into_Salesforce
    Contact Creation Without Salutation
    Set Selenium Implicit Wait  15s
    Verifying_Greeting_Field_Value
    Should Be Equal  ${Greeting_Value}  Friend
    Capture Page Screenshot
    close browser

ADF_REL-04

    [Tags]  QA1_Demo
    [Documentation]    *Functionality*
    ...    To check whether the "Greeting" field value, when a user creating the household contact record with "Nickname" field value.
    ...

    ...    *Test Steps*
    ...
    ...    1. Open the sandbox "test.salesforce.com"
    ...    2. Enter the valid username and password
    ...    3. Click ""Submit"" button
    ...    4. Navigates to "Contacy" object
    ...    5. Click new button and then choose the record type
    ...    6. Click continue button
    ...    7. Enter the contact record details
    ...    8. Click save button
    ...    9. Verfiy the expected result"
    ...
    ...    *Expected Result*
    ...
    ...    9.1 The "Greeting" field value should be updated as "Test_QA"

    #TestCase
    ${FirstName_V}=    read_excel_data  Contact     ADF_REL-04     FirstName
    Set Global Variable   ${FirstName_V}
    ${LastName_V}=    read_excel_data  Contact      ADF_REL-04    LastName
    Set Global Variable     ${LastName_V}
    ${Salutation_V}=    read_excel_data  Contact      ADF_REL-04    Salutation
    Set Global Variable   ${Salutation_V}
    ${NickName_V}=    read_excel_data  Contact      ADF_REL-04    NickName
    Set Global Variable   ${NickName_V}
    ${SpouseName_V}=  read_excel_data  Contact     ADF_REL-04    SpouseName
    Set Global Variable  ${SpouseName_V}
    ${Mail_Street_V}=  read_excel_data  Contact     ADF_REL-04     MailingStreet
    Set Global Variable  ${Mail_Street_V}
    ${Mail_City_V}=   read_excel_data  Contact     ADF_REL-04    MailingCity
    set global variable  ${Mail_City_V}
    ${Mail_State_V}=  read_excel_data  Contact     ADF_REL-04     MailingState
    set global variable  ${Mail_State_V}
    ${Mail_Code_V}=   read_excel_data  Contact     ADF_REL-04     MailingZipCode
    set global variable  ${Mail_Code_V}
    ${Mail_Country_V}=    read_excel_data  Contact     ADF_REL-04     MailingCountry
    set global variable  ${Mail_Country_V}
    ${Contact_Email_V}=   read_excel_data  Contact     ADF_REL-04     Email
    set global variable  ${Contact_Email_V}
    ${Birth_Date_V}   read excel data     Contact     ADF_REL-04     BirthDate
    set global variable  ${Birth_Date_V}
    Log_into_Salesforce
    Contact Creation Without Salutation
    Set Selenium Implicit Wait  15s
    Verifying_Greeting_Field_Value
    Should Be Equal  ${Greeting_Value}  ${NickName_V}
    Capture Page Screenshot
    Close Browser

ADF_REL-05

    [Tags]  Email_QA
    [Documentation]    *Functionality*
    ...    To check whether the "Phone" field value is updated or not based on the selection of "Preferred Phone" type, while creating a new contact record.
    ...

    ...    *Test Steps*
    ...
    ...    1. Open the sandbox "test.salesforce.com"
    ...    2. Enter the valid username and password
    ...    3. Click ""Submit"" button
    ...    4. Navigates to "Contacy" object
    ...    5. Click new button and then choose the record type
    ...    6. Click continue button
    ...    7. Enter the contact record details
    ...    8. Enter the values in the "Home Phone" field and select "Preferred Phone Type" as Home
    ...    9. Click save button
    ...    10. Verfiy the expected result"
    ...
    ...    *Expected Result*
    ...
    ...    10.1 The "Phone" field value should be populated from the Home Phone field

    #TestCase
    ${FirstName_V}=    read_excel_data  Contact     ADF_REL-05     FirstName
    Set Global Variable   ${FirstName_V}
    ${LastName_V}=    read_excel_data  Contact      ADF_REL-05    LastName
    Set Global Variable     ${LastName_V}
    ${Salutation_V}=    read_excel_data  Contact      ADF_REL-05    Salutation
    Set Global Variable   ${Salutation_V}
    ${NickName_V}=    read_excel_data  Contact      ADF_REL-05   NickName
    Set Global Variable   ${NickName_V}
    ${SpouseName_V}=  read_excel_data  Contact     ADF_REL-05    SpouseName
    Set Global Variable  ${SpouseName_V}
    ${Mail_Street_V}=  read_excel_data  Contact     ADF_REL-05     MailingStreet
    Set Global Variable  ${Mail_Street_V}
    ${Mail_City_V}=   read_excel_data  Contact     ADF_REL-05   MailingCity
    set global variable  ${Mail_City_V}
    ${Mail_State_V}=  read_excel_data  Contact     ADF_REL-05    MailingState
    set global variable  ${Mail_State_V}
    ${Mail_Code_V}=   read_excel_data  Contact     ADF_REL-05    MailingZipCode
    set global variable  ${Mail_Code_V}
    ${Mail_Country_V}=    read_excel_data  Contact     ADF_REL-05    MailingCountry
    set global variable  ${Mail_Country_V}
    ${Contact_Email_V}=   read_excel_data  Contact     ADF_REL-05     Email
    set global variable  ${Contact_Email_V}
    ${Birth_Date_V}   read excel data     Contact     ADF_REL-05     BirthDate
    set global variable  ${Birth_Date_V}
    ${Home_Phone_V}=    read_excel_data  Contact     ADF_REL-05    Home Phone
    set global variable  ${Home_Phone_V}
    ${Mobile_V}=   read_excel_data      Contact     ADF_REL-05     MobilePhone
    set global variable  ${Mobile_V}
    ${WorkPhone_V}   read excel data     Contact     ADF_REL-05     Work Phone
    set global variable  ${WorkPhone_V}
    ${WorkPhone_Extension_V}   read excel data     Contact     ADF_REL-05     Work Phone Extension
    set global variable  ${WorkPhone_Extension_V}
    ${EmailContent_V}   read excel data     Email     ADF_REL-05     Email Content
    set global variable  ${EmailContent_V}
    ${Test}=   read_email_body     nall11sf@gmail.com      metasoft@123
    Log  ${Test}
    Should Contain  ${EmailContent_V}   ${Test}
    ${content}=    read subject  ${Test}
    Log  ${content}
    #Log_into_Salesforce
    #Contact Creation With Home Phone
    #Set Selenium Implicit Wait  15s
    #Verify_Preffered_Phone_Value
    #Verify_Preffered_Phone_Value
    #Should Be Equal  ${Primary_Phone}   ${HomePhone_V}
    #Capture Page Screenshot
    #Close Browser

ADF_REL-06

    [Tags]  DemoQA
    [Documentation]    *Functionality*
    ...    To check whether the "Phone" field value is updated or not based on the selection of "Preferred Phone" type, while creating a new contact record.
    ...

    ...    *Test Steps*
    ...
    ...    1. Open the sandbox "test.salesforce.com"
    ...    2. Enter the valid username and password
    ...    3. Click ""Submit"" button
    ...    4. Navigates to "Contacy" object
    ...    5. Click new button and then choose the record type
    ...    6. Click continue button
    ...    7. Enter the contact record details
    ...    8. Enter the values in the "Mobile" field and select "Preferred Phone Type" as Mobile
    ...    9. Click save button
    ...    10. Verfiy the expected result"
    ...
    ...    *Expected Result*
    ...
    ...    10.1 The "Phone" field value should be populated from the Mobile field

    #TestCase
    ${Browser}=     read_excel_data  Contact     ADF_REL-06    Browser
    Set Global Variable  ${Browser}
    ${FirstName_V}=    read_excel_data  Contact     ADF_REL-06     FirstName
    Set Global Variable   ${FirstName_V}
    ${LastName_V}=    read_excel_data  Contact      ADF_REL-06     LastName
    Set Global Variable     ${LastName_V}
    ${Salutation_V}=    read_excel_data  Contact      ADF_REL-06     Salutation
    Set Global Variable   ${Salutation_V}
    ${NickName_V}=    read_excel_data  Contact      ADF_REL-06    NickName
    Set Global Variable   ${NickName_V}
    ${SpouseName_V}=  read_excel_data  Contact     ADF_REL-06     SpouseName
    Set Global Variable  ${SpouseName_V}
    ${Mail_Street_V}=  read_excel_data  Contact     ADF_REL-06      MailingStreet
    Set Global Variable  ${Mail_Street_V}
    ${Mail_City_V}=   read_excel_data  Contact     ADF_REL-06   MailingCity
    set global variable  ${Mail_City_V}
    ${Mail_State_V}=  read_excel_data  Contact     ADF_REL-06    MailingState
    set global variable  ${Mail_State_V}
    ${Mail_Code_V}=   read_excel_data  Contact     ADF_REL-06     MailingZipCode
    set global variable  ${Mail_Code_V}
    ${Mail_Country_V}=    read_excel_data  Contact     ADF_REL-06     MailingCountry
    set global variable  ${Mail_Country_V}
    ${Contact_Email_V}=   read_excel_data  Contact     ADF_REL-06       Email
    set global variable  ${Contact_Email_V}
    ${Birth_Date_V}   read excel data     Contact     ADF_REL-06     BirthDate
    set global variable  ${Birth_Date_V}
    ${Home_Phone_V}=    read_excel_data  Contact     ADF_REL-06    Home Phone
    set global variable  ${Home_Phone_V}
    ${Mobile_V}=   read_excel_data      Contact     ADF_REL-06     MobilePhone
    set global variable  ${Mobile_V}
    ${WorkPhone_V}   read excel data     Contact     ADF_REL-06     Work Phone
    set global variable  ${WorkPhone_V}
    ${WorkPhone_Extension_V}   read excel data     Contact     ADF_REL-06     Work Phone Extension
    set global variable  ${WorkPhone_Extension_V}
    ${Preffered_Phone_V}=       read excel data     Contact     ADF_REL-06     Preffered Phone
    set global variable  ${Preffered_Phone_V}
    Log_into_Salesforce
    Contact Creation With Mobile
    Set Selenium Implicit Wait  15s
    Verify_Preffered_Phone_Value
    Should Be Equal  ${Primary_Phone}   ${Mobile_V}
    Capture Page Screenshot
    Close Browser

ADF_REL-07

    [Tags]  Passed
    [Documentation]    *Functionality*
    ...    To check whether the "Phone" field value is updated or not based on the selection of "Preferred Phone" type, while creating a new contact record.
    ...
    ...    *Test Steps*
    ...
    ...    1. Open the sandbox "test.salesforce.com"
    ...    2. Enter the valid username and password
    ...    3. Click ""Submit"" button
    ...    4. Navigates to "Contacy" object
    ...    5. Click new button and then choose the record type
    ...    6. Click continue button
    ...    7. Enter the contact record details
    ...    8. Select "Preferred Phone Type" as Work
    ...    9. Click save button
    ...    10. Verfiy the expected result"
    ...
    ...    *Expected Result*
    ...
    ...    10.1 The "Phone" field value should be populated from the Work and Work Exstension field

    #TestCase
    ${FirstName_V}=    read_excel_data  Contact     ADF_REL-07     FirstName
    Set Global Variable   ${FirstName_V}
    ${LastName_V}=    read_excel_data  Contact      ADF_REL-07     LastName
    Set Global Variable     ${LastName_V}
    ${Salutation_V}=    read_excel_data  Contact      ADF_REL-07     Salutation
    Set Global Variable   ${Salutation_V}
    ${NickName_V}=    read_excel_data  Contact      ADF_REL-07    NickName
    Set Global Variable   ${NickName_V}
    ${SpouseName_V}=  read_excel_data  Contact     ADF_REL-07     SpouseName
    Set Global Variable  ${SpouseName_V}
    ${Mail_Street_V}=  read_excel_data  Contact     ADF_REL-07      MailingStreet
    Set Global Variable  ${Mail_Street_V}
    ${Mail_City_V}=   read_excel_data  Contact     ADF_REL-07   MailingCity
    set global variable  ${Mail_City_V}
    ${Mail_State_V}=  read_excel_data  Contact     ADF_REL-07    MailingState
    set global variable  ${Mail_State_V}
    ${Mail_Code_V}=   read_excel_data  Contact     ADF_REL-07     MailingZipCode
    set global variable  ${Mail_Code_V}
    ${Mail_Country_V}=    read_excel_data  Contact     ADF_REL-07     MailingCountry
    set global variable  ${Mail_Country_V}
    ${Contact_Email_V}=   read_excel_data  Contact     ADF_REL-07       Email
    set global variable  ${Contact_Email_V}
    ${Birth_Date_V}   read excel data     Contact     ADF_REL-07     BirthDate
    set global variable  ${Birth_Date_V}
    ${Home_Phone_V}=    read_excel_data  Contact     ADF_REL-07    Home Phone
    set global variable  ${Home_Phone_V}
    ${Mobile_V}=   read_excel_data  Contact     ADF_REL-07      MobilePhone
    set global variable  ${Mobile_V}
    ${WorkPhone_V}=   read excel data     Contact     ADF_REL-07     Work Phone
    set global variable  ${WorkPhone_V}
    ${WorkPhone_Extension_V}=   read excel data     Contact     ADF_REL-07     Work Phone Extension
    set global variable  ${WorkPhone_Extension_V}
    ${Preffered_Phone_V}=       read excel data     Contact     ADF_REL-07     Preffered Phone
    set global variable  ${Preffered_Phone_V}
    Log_into_Salesforce
    Contact Creation With Work Phone
    Set Selenium Implicit Wait  15s
    Verify_Preffered_Phone_Value
    Should Be Equal  ${Primary_Phone}   ${WorkPhone}
    Close Browser

ADF_REL-08
    [Tags]  Demo
    [Documentation]    *Functionality*
    ...    To Verify the Communication preffernce field in Household contact
    ...
    ...    *Test Steps*
    ...
    ...    1. Open the sandbox "test.salesforce.com"
    ...    2. Enter the valid username and password
    ...    3. Click ""Submit"" button
    ...    4. Navigates to "Contacy" object
    ...    5. Click new button and then choose the record type
    ...    6. Click continue button
    ...    7. Enter the contact record details
    ...    8. Click Save button
    ...    *Expected Result*
    ...
    ...    8.1 Communication prefference field should not be checked

    #TestCase
    ${FirstName_V}=    read_excel_data  Contact     ADF_REL-08    FirstName
    Set Global Variable   ${FirstName_V}
    ${LastName_V}=    read_excel_data  Contact      ADF_REL-08    LastName
    Set Global Variable      ${LastName_V}
    ${Salutation_V}=    read_excel_data  Contact      ADF_REL-08    Salutation
    Set Global Variable   ${Salutation_V}
    ${NickName_V}=    read_excel_data  Contact      ADF_REL-08     NickName
    Set Global Variable   ${NickName_V}
    ${SpouseName_V1}=  read_excel_data  Contact     ADF_REL-08     SpouseName
    Set Global Variable  ${SpouseName_V1}
    ${Mail_Street_V}=  read_excel_data  Contact     ADF_REL-08     MailingStreet
    Set Global Variable  ${Mail_Street_V}
    ${Mail_City_V}=   read_excel_data  Contact     ADF_REL-08     MailingCity
    set global variable  ${Mail_City_V}
    ${Mail_State_V}=  read_excel_data  Contact     ADF_REL-08     MailingState
    set global variable  ${Mail_State_V}
    ${Mail_Code_V}=   read_excel_data  Contact     ADF_REL-08     MailingZipCode
    set global variable  ${Mail_Code_V}
    ${Mail_Country_V}=    read_excel_data  Contact     ADF_REL-08    MailingCountry
    set global variable  ${Mail_Country_V}
    ${Contact_Email_V}=   read_excel_data  Contact     ADF_REL-08     Email
    set global variable  ${Contact_Email_V}
    Log_into_Salesforce
    Contact Creation With Salutation
    Set Selenium Implicit Wait  15s
    Houesehold_Contact_Communication_Field_Verification
    Close Browser

ADF_REL-09
    [Tags]  Demo
      [Documentation]    To verify whether the related address and email record is created or not, when updating the contact's mailing address and email field
    ...
    ...    *Test Steps*
    ...
    ...    1. Open the Sandbox "https://test.salesforce.com/"
    ...    2. Enter valid username and password
    ...    3. Click "Submit" button
    ...    4. Navigates to "Contact" object
    ...    5. Select "Household" contact in recent list
    ...    6. Click "Edit" button and Updated the Mailing address fields value as similar to the existing address in the Related Address object.
    ...    7. Click "Save" button
    ...
    ...    *Expected Result*
    ...
    ...    7.1 The Related Address record should be created in Historical Address record type
    ...    7.2 Old contact address should be mapped with the newly created related address record
    ...    7.3. Following field should be updated on the Related Address record ""Bad Address, Do Not Mail,
    ...    Mail Opt Out, and Mail Opt Out Date"
    ...    7.4 Related Email record should be created
    ...    7.5 Email status, Do Not Email, Email Opt Out, and Email Opt Out Date field shoudl be updated on the related email record
    [Template]
    #TestCase
    ${ContactName_Value}=        read excel data  Contact_Selection   ADF_REL-09    Contact Select
    Set Global Variable   ${ContactName_Value}
    ${RecordID}=     read excel data     Contact_Selection    ADF_REL-09     Contact_Record Id
    Set Global Variable   ${RecordID}
    ${Contact_Email_V}=   read_excel_data  Contact     ADF_REL-09     Email
    set global variable  ${Contact_Email_V}
    Common_Configure.Log_into_Salesforce
    Wait Until Element Is Visible    ${Contact_Tab}
    Click Element    ${Contact_Tab}
    Wait Until Element Is Visible    ${New_Button}
    Contact.Contact_Choose
    Contact.Get_values_from_Contact_record
    Updating_The_Eamil
    Contact.Related Email_RelatedList_From_Contact
    Related_Email_Verification
    Should Be Equal  ${RE_Email}    ${Contact_Email}
    Close Browser

ADF_REG-10
    [Tags]  TestDemo1
    [Documentation]    To verify whether the related address and email record is created or not, when updating the contact's mailing address and email field
    ...    *Test Steps*
    ...
    ...    1. Open the Sandbox "https://test.salesforce.com/"
    ...    2. Enter valid username and password
    ...    3. Click "Submit" button
    ...    4. Navigates to "Contact" object
    ...    5. Select "Household" contact in recent list
    ...    6. Click "Edit" button and Updated the Mailing address fields value as similar to the existing address in the Related Address object.
    ...    7. Click "Save" button
    ...
    ...    *Expected Result*
    ...
    ...    7.1 The Related Address record should be created in \ Historical Address record type
    ...    7.2 Old contact address should be mapped with the newly created related address record
    ...    7.3. Following field should be updated on the Related Address record ""Bad Address, Do Not Mail,
    ...    Mail Opt Out, and Mail Opt Out Date"
    ...    7.4 Related Email record should be created
    ...    7.5 Email status, Do Not Email, Email Opt Out, and Email Opt Out Date field shoudl be updated on the related email record
    [Template]

    #TestCase
    ${RecordID}=     read excel data     Contact_Selection    ADF_REL-10     Contact_Record Id
    Set Global Variable   ${RecordID}
    ${ContactName_Value}=        read excel data  Contact_Selection   ADF_REL-10    Contact Select
    Set Global Variable   ${ContactName_Value}
    Common_Configure.Log_into_Salesforce
    Contact.Contact_Choose
    #Contact.Get_values_from_Contact_record
    Contact.Contact_Mailing_Address
    Contact.Updating_The_Mailing_Address
    Wait Until Element Is Visible    ${Edit_Button}
    Contact.Related Addres_Related List_From_Contact
    Wait Until Element Is Visible   ${Related_Address_E}
    Get_Related_Address_Values
    Navigates_To_Cotact
    Should Be Equal  ${Mailing_Street_Value}    ${RA_Street}
    Should Be Equal  ${Mailing_City_Value}  ${RA_City}
    Should Be Equal  ${Mailing_State_Value}     ${RA_State}
    Should Be Equal  ${Mailing_Country_Value}   ${RA_Country}
    Should Be Equal  ${Mailing_ZipCode_Value}   ${RA_Code}
    Capture Page Screenshot
    Close Browser

ADF_REL-11
    [Tags]  QA1_Demo
    [Documentation]    *Functionality*
    ...    To verify whether the Organization Donor Proxy Contact record is created or not, when creating a Organization Account
    ...
    ...    *Test Steps*
    ...
    ...    1. Open the sandbox "test.salesforce.com"
    ...    2. Enter the valid username and password
    ...    3. Click ""Submit"" button
    ...    4. Navigates to "Account" object
    ...    5. Click new button and then choose the record type
    ...    6. Click continue button
    ...    7. Enter the account information
    ...    8. Click save button
    ...    9. Verfiy the expected result
    ...
    ...    *Expected Result*
    ...
    ...    9.1 Organization Donor Proxy Contact record shoould be created with name of Organization account

    #TestCase
    ${Acc_Name_V}=    read_excel_data   Account     ADF_REL-11    AccountName
    set global variable  ${Acc_Name_V}
    ${Bill_St_V}=     read_excel_data   Account     ADF_REL-11     BillingStreet
    set global variable  ${Bill_St_V}
    ${Bill_City_V}=   read_excel_data   Account     ADF_REL-11     BillingCity
    set global variable  ${Bill_City_V}
    ${Bill_Code_V}=   read_excel_data   Account          ADF_REL-11     BillingZipCode
    set global variable  ${Bill_Code_V}
    ${Bill_State_V}=      read_excel_data   Account     ADF_REL-11      BillingState
    set global variable  ${Bill_State_V}
    ${Bill_Country_V}=    read_excel_data   Account      ADF_REL-11     BillingCountry
    set global variable  ${Bill_Country_V}
    Common_Configure.Log_into_Salesforce
    Account.Organization_Account_Creation
    Account.ODP_Contact_Verification_From_Account

ADF_REL-12

    [Tags]  QA1_Demo
    [Documentation]    *Functionality*
    ...    To verify whether the new contact record is created or not under the household account by clicking "New" button
    ...
    ...    *Test Steps*
    ...
    ...    1. Open the sandbox "test.salesforce.com"
    ...    2. Enter the valid username and password
    ...    3. Click "Submit" button
    ...    4. Navigates to "Account" object
    ...    5. Open the Household account record in account recent list
    ...    6. Navigate to account details page
    ...    7. Scroll down the Contact related list section
    ...    8. Click "New" button and then create new contact record under the account
    ...    9. Verfiy the expected result"
    ...
    ...    *Expected Result*
    ...
    ...    9.1 The contact record should be created under the account record
    ...    9.2 Head of Household flag should be false
    #Testcase
    ${FirstName_V}=    read_excel_data  Contact     ADF_REL-08    FirstName
    Set Global Variable   ${FirstName_V}
    ${LastName_V}=    read_excel_data  Contact      ADF_REL-08    LastName
    Set Global Variable      ${LastName_V}
    ${Salutation_V}=    read_excel_data  Contact      ADF_REL-08    Salutation
    Set Global Variable   ${Salutation_V}
    ${NickName_V}=    read_excel_data  Contact      ADF_REL-08     NickName
    Set Global Variable   ${NickName_V}
    ${SpouseName_V1}=  read_excel_data  Contact     ADF_REL-08     SpouseName
    Set Global Variable  ${SpouseName_V1}
    ${Mail_Street_V}=  read_excel_data  Contact     ADF_REL-08     MailingStreet
    Set Global Variable  ${Mail_Street_V}
    ${Mail_City_V}=   read_excel_data  Contact     ADF_REL-08     MailingCity
    set global variable  ${Mail_City_V}
    ${Mail_State_V}=  read_excel_data  Contact     ADF_REL-08     MailingState
    set global variable  ${Mail_State_V}
    ${Mail_Code_V}=   read_excel_data  Contact     ADF_REL-08     MailingZipCode
    set global variable  ${Mail_Code_V}
    ${Mail_Country_V}=    read_excel_data  Contact     ADF_REL-08    MailingCountry
    set global variable  ${Mail_Country_V}
    ${AccountName_Value}=   read excel data  Contact_Selection    ADF_REL-12  Account Select
    Set Global Variable     ${AccountName_Value}
    Log_into_Salesforce
    Account_Choose
    Household_Contact_Creation_From_Account
    Contact_Creation_With_HOH_Checked
    Head_Of_Household_Verifcation_For_HOH_Enabled_SecondContact
    Uncheck_Head_Of_Household_Flag

ADF_REL-13

    [Tags]  DemoQA
    [Documentation]    *Functionality*
    ...    To verify whether the Head of Household flag is updated or not, when user creating the second record with HOH is chencked
    ...    *Test Steps*
    ...
    ...    1. Open the sandbox "test.salesforce.com"
    ...    2. Enter the valid username and password
    ...    3. Click ""Submit"" button
    ...    4. Navigates to "Account" object
    ...    5. Open the Household account record in account recent list
    ...    6. Navigate to account details page
    ...    7. Scroll down the Contact related list section
    ...    8. Click "New" button and then create new contact record under the account
    ...    9. Verfiy the expected result"
    ...
    ...    *Expected Result*
    ...
    ...    9.1 The contact record should be created under the account record
    ...    9.2 Head of Household flag should be True
    ...    9.3 Exsting Contact's Head of Household flag should be updated as False
    #Testcase
    ${Browser}=     read_excel_data  Contact     ADF_REL-08    Browser
    Set Global Variable  ${Browser}
    ${FirstName_V}=    read_excel_data  Contact     ADF_REL-08    FirstName
    Set Global Variable   ${FirstName_V}
    ${LastName_V}=    read_excel_data  Contact      ADF_REL-08    LastName
    Set Global Variable      ${LastName_V}
    ${Salutation_V}=    read_excel_data  Contact      ADF_REL-08    Salutation
    Set Global Variable   ${Salutation_V}
    ${NickName_V}=    read_excel_data  Contact      ADF_REL-08     NickName
    Set Global Variable   ${NickName_V}
    ${SpouseName_V1}=  read_excel_data  Contact     ADF_REL-08     SpouseName
    Set Global Variable  ${SpouseName_V1}
    ${Mail_Street_V}=  read_excel_data  Contact     ADF_REL-08     MailingStreet
    Set Global Variable  ${Mail_Street_V}
    ${Mail_City_V}=   read_excel_data  Contact     ADF_REL-08     MailingCity
    set global variable  ${Mail_City_V}
    ${Mail_State_V}=  read_excel_data  Contact     ADF_REL-08     MailingState
    set global variable  ${Mail_State_V}
    ${Mail_Code_V}=   read_excel_data  Contact     ADF_REL-08     MailingZipCode
    set global variable  ${Mail_Code_V}
    ${Mail_Country_V}=    read_excel_data  Contact     ADF_REL-08    MailingCountry
    set global variable  ${Mail_Country_V}
    ${AccountName_Value}=   read excel data  Contact_Selection    ADF_REL-13  Account Select
    Set Global Variable     ${AccountName_Value}
    Log_into_Salesforce
    Account_Choose
    Household_Contact_Creation_From_Account
    Contact_Creation_With_HOH_Unchecked
    Head_Of_Household_Verifcation_For_SecondContact

ADF_REL-14

    [Tags]  QA1_Demo
    [Documentation]    *Functionality*
    ...    To verify whether the donation record is created or not
    ...
    ...    *Test Steps*
    ...
    ...    1. Open the sandbox "test.salesforce.com"
    ...    2. Enter the valid username and password
    ...    3. Click ""Submit"" button
    ...    4. Navigates to "Donation" object
    ...    5. Click new button and then choose the record type
    ...    6. Click continue button
    ...    7. Choose the donor and account name and then enter the donation record details
    ...    8.Click save button
    ...    9. Scroll down to donation contact role VF page section
    ...    10. Click Edit contact roles button on VF page
    ...    11. Verfiy the expected result"
    ...
    ...    *Expected Result*
    ...
    ...    11.1 Donation contact role record should be created with name of Donor and the amount field should be updates as "Full"
    ...    11.2 New \ soft credit contact role record should \ be created \ from the donor's relaitionship viwer VF page

    #TestCase
    ${Don_Name_V}=   read excel data     Donation    ADF_REL-14     DonationName
    Set Global Variable  ${Don_Name_V}
    ${Don_Donor_V}=  read excel data  Donation   ADF_REL-14      Donor
    Set Global Variable  ${Don_Donor_V}
    ${Don_Amt_V}=    read excel data     Donation    ADF_REL-14      Amount
    Set Global Variable  ${Don_Amt_V}
    ${Don_Sourcecode_V}=    read excel data  Donation   ADF_REL-14      SourceCode
    Set Global Variable  ${Don_Sourcecode_V}
    Donation.Donation_Creation
    Close Browser

ADF_REG-15

    [Tags]  QA1_Demo
    [Documentation]    *Functionality*
    ...    To verify whether the donation contact role record is created or not
    ...
    ...    *Test Steps*
    ...
    ...    1. Open the sandbox "test.salesforce.com"
    ...    2. Enter the valid username and password
    ...    3. Click ""Submit"" button
    ...    4. Navigates to "Donation" object
    ...    5. Click new button and then choose the record type
    ...    6. Click continue button
    ...    7. Choose the donor and account name and then enter the donation record details
    ...    8.Click save button
    ...    9. Scroll down to donation contact role VF page section
    ...    10. Click Edit contact roles button on VF page
    ...    11. Verfiy the expected result"
    ...
    ...    *Expected Result*
    ...
    ...    11.1 Donation contact role record should be created with name of Donor and the amount field should be updates as "Full"
    ...    11.2 New \ soft credit contact role record should \ be created \ from the donor's relaitionship viwer VF page

    #TestCase
    Common_Configure.Log_into_Salesforce
    Donation.Donation_Donor_Role_Verification
    Close Browser

ADF_REL-16
    [Tags]  Passed
    [Documentation]   *Functionality*
    ...    To verify whether the Donation name is updated or not when updating the Donor

    ${DonationName_V}=   read excel data     Donation    ADF_REL-16     Donation Select
    Set Global Variable  ${DonationName_V}
    ${Donor_update_Value}=  read excel data     Donation    ADF_REL-16     Donor
    Set Global Variable  ${Donor_update_Value}
    Common_Configure.Log_into_Salesforce
    Donation.Updating_the_Donor_Value
    Close Browser

ADF_REG-17
    [Tags]  Passed
    [Documentation]    *Functionality*
    ...
    ...    To verify the Desigation VF page after creating the Donation record
    ...
    ...    *Test Steps*
    ...
    ...    1. Open the sandbox "test.salesforce.com"
    ...    2. Enter the valid username and password
    ...    3. Click ""Submit"" button
    ...    4. Navigates to "Donation" object
    ...    5. Click new button and then choose the record type
    ...    6. Click continue button
    ...    7. Choose the donor and account name and then enter the donation record details
    ...    8.Click save button
    ...    9. Scroll down to Donation Designation VF page section
    ...    10. Verfiy the expected result"
    ...
    ...    *Expected Result*
    ...
    ...    10.1 Total amount and Designated amuont should be equal
    ...    10.2 Default Designation should be checked and it is available on center of the VF page

    #TestCase
    Common_Configure.Log_into_Salesforce
    Donation.Donation_Designation_VF_verification
    Close Browser

ADF_REG-18
    [Tags]  DemoQA
    [Documentation]    *Functionality*
    ...
    ...    To check whether the Contact record is updated or not when updating the "Head Of Household " is true to false
    ...    *Test Steps*
    ...
    ...    1. Open Sandbox "https://test.salesforce.com/"
    ...    2. Enter valid username and password
    ...    3. Click "Submit" button
    ...    4. Navigates to "Contact" object and click "New" button
    ...    5. Select Record type as "Household Contact" and click "Continue" button
    ...    6. Enter the values in the contact edit page fields
    ...    7. Click "Save" button.
    ...
    ...
    ...    *Expected Result*
    ...
    ...    The "Head Of Household" field should not be updated and it should be displayed error message

    [Setup]

    ${ContactName_Value}=   read excel data  Contact_Selection   ADF_REL-18    Contact Select
    Set Global Variable   ${ContactName_Value}
    Common_Configure.Log_into_Salesforce
    Contact.Contact_Choose
    #Contact.Contact_Field_Verification
    Contact.Uncheck_Head_Of_Household_Flag
    #Contact.Contact_Field_Verification
    Close Browser

ADF_REG-19
    [Tags]  Passed
    [Documentation]    *Functionality*
    ...    To verify whether the donation contact role record is created or not
    ...
    ...    *Test Steps*
    ...
    ...    1. Open the sandbox "test.salesforce.com"
    ...    2. Enter the valid username and password
    ...    3. Click ""Submit"" button
    ...    4. Navigates to "Donation" object
    ...    5. Click new button and then choose the record type
    ...    6. Click continue button
    ...    7. Choose the donor and account name and then enter the donation record details
    ...    8.Click save button
    ...    9. Scroll down to donation contact role VF page section
    ...    10. Click Edit contact roles button on VF page
    ...    11. Verfiy the expected result"
    ...
    ...    *Expected Result*
    ...
    ...    11.1 Donation contact role record should be created with name of Donor and the amount field should be updates as "Full"
    ...    11.2 New \ soft credit contact role record should \ be created \ from the donor's relaitionship viwer VF page

    #TestCase

    ${DonationName_V}=      read excel data  Donation   ADF_REL-19    Donation Select
    Set Global Variable    ${DonationName_V}
    ${New_Contact_Role_V}=      read excel data  Donation   ADF_REL-19    ContactRole Value
    Set Global Variable    ${New_Contact_Role_V}
    ${Contact_Role_Amount_V}=      read excel data  Donation   ADF_REL-19    ContactRole Amount
    Set Global Variable    ${Contact_Role_Amount_V}
    Log_into_Salesforce
    Donation.Add_New_Single_Contact_Role
    Close Browser

ADF_REG-20

    [Tags]  Passed
    [Documentation]    *Functionality*
    ...    To verify whether the donation contact role record is created or not
    ...
    ...    *Test Steps*
    ...
    ...    1. Open the sandbox "test.salesforce.com"
    ...    2. Enter the valid username and password
    ...    3. Click ""Submit"" button
    ...    4. Navigates to "Donation" object
    ...    5. Click new button and then choose the record type
    ...    6. Click continue button
    ...    7. Choose the donor and account name and then enter the donation record details
    ...    8.Click save button
    ...    9. Scroll down to donation contact role VF page section
    ...    10. Click Edit contact roles button on VF page
    ...    11. Verfiy the expected result"
    ...
    ...    *Expected Result*
    ...
    ...    11.1 Donation contact role record should be created with name of Donor and the amount field should be updates as "Full"
    ...    11.2 New \ soft credit contact role record should \ be created \ from the donor's relaitionship viwer VF page

    #TestCase
    ${DonationName_V}=        read excel data  Donation   ADF_REL-20    Donation Select
    Set Global Variable    ${DonationName_V}
    ${Contact_Role_Amount_V}=      read excel data  Donation   ADF_REL-20    ContactRole Amount
    Set Global Variable    ${Contact_Role_Amount_V}
    Common_Configure.Log_into_Salesforce
    Donation.Donation_Choose
    Donation.Add_New_Multiple_Contact_Role
    Close Browser

ADF_REG-21

    [Tags]   Passed
    [Documentation]    *Functionality*
    ...    To verify whether the donation record is created or not from contact
    ...

    ${ContactName_Value}=        read excel data  Contact   ADF_REL-21    Contact Value
    Set Global Variable   ${ContactName_Value}
    Common_Configure.Log_into_Salesforce
    Donation.Donation_Creation_From_Contact

ADF_REG-22

    [Tags]  Passed
    [Documentation]    *Functionality*
    ...    To verify whether the donation contact role record is created or not when creating a donation frmo contact

    ...
    ...    *Test Steps*
    ...
    ...    1. Open the sandbox "test.salesforce.com"
    ...    2. Enter the valid username and password
    ...    3. Click ""Submit"" button
    ...    4. Navigates to "Contact" object
    ...    5. Choose the Contact and Click new button on Donation relatedlist
    ...    6. Enter the donation record details and then click save
    ...    9. Scroll down to donation contact role VF page section
    ...    10. Click Edit contact roles button on VF page
    ...    11. Verfiy the expected result"

    ${ContactName_Value}=        read excel data  Donation   ADF_REL-22    Contact Select
    Set Global Variable   ${ContactName_Value}
    Common_Configure.Log_into_Salesforce
    Donation.Contact_Relationship_Viewer

ADF_REG-23

    [Tags]  Passed
    [Documentation]    *Functionality*
    ...    To verify whether the donation record is created or not from contact

    ${DonationName_V}=        read excel data  Donation   ADF_REL-23    Donation Select
    Set Global Variable    ${DonationName_V}
    ${Donor_update_Value}=  read excel data  Donation   ADF_REL-23    Donor
    Set Global Variable    ${Donor_update_Value}
    Common_Configure.Log_into_Salesforce
    Updating_the_Donor_For_ReceivedDonaton


ADF_REG-24

    [Tags]  Passed
    [Documentation]    *Functionality*
    ...    To verify whether the donation record is created or not from contact

    ${DonationName_V}=        read excel data  Donation   ADF_REL-24    Donation Select
    Set Global Variable    ${DonationName_V}
    ${Don_Sourcecode_V}=    read excel data  Donation   ADF_REL-24      SourceCode
    Set Global Variable  ${Don_Sourcecode_V}
    Common_Configure.Log_into_Salesforce
    Updating_the_Donor_For_ReceivedDonaton(Other Fields)

ADF-REG-25

    [Tags]  Passed
    [Documentation]    *Functionality*
    ...    To verify whether the CampaignSegment, Sourcecode

    ${DonationName_V}=        read excel data  Donation   ADF_REL-25    Donation Select
    Set Global Variable   ${DonationName_V}
    #Common_Configure.Log_into_Salesforce
    Updating_the_SourceCode_Value
    Verfiying_SourceCode_Value

ADF_REG-26

    [Tags]  Passed
    [Documentation]    *Functionality*
    ...    To verify whether the CampaignSegment, Sourcecode

    ${DonationName_V}=        read excel data  Donation   ADF_REL-26    Donation Select
    Set Global Variable    ${DonationName_V}
    Common_Configure.Log_into_Salesforce
    Updating_the_CampaignSegment_Value
    Verfiying_SourceCode_Value

ADF-REG-27

    [Tags]  Passed
    [Documentation]    *Functionality*
    ...    To verify whether the Contact Record Type (Household To International) Change

    ${ContactName_Value}=        read excel data  Donation   ADF_REL-27    Contact Select
    Set Global Variable   ${ContactName_Value}
    Common_Configure.Log_into_Salesforce
    #Contact_Table_Iteration
    Contact_Choose
    Updating_the_Contact_Recordtype

ADF_REG-28

    [Tags]  Passed
    [Documentation]    *Functionality*
    ...    To verify whether the Contact Record Type (ODP To Household) Change

    ${ContactName_Value}=     read excel data     Contact_Selection   ADF_REL-28    Contact Select
    Set Global Variable  ${ContactName_Value}
    Common_Configure.Log_into_Salesforce
    #Contact_Table_Iteration
    Contact_Choose
    Updating_the_Contact_Recordtype

ADF-REG-29
    [Tags]  Passed
    [Documentation]    *Functionality*
    ...    To verify whether the Contact Mailing address is updated to the Account's billing address

    ${ContactName_Value}=     read excel data     Contact_Selection    ADF_REL-29     Contact Select
    Set Global Variable  ${ContactName_Value}
    ${AccountName_Value}=     read excel data     Contact_Selection     ADF_REG-29   Account Value
    Set Global Variable  ${AccountName_Value}
    Common_Configure.Log_into_Salesforce
    #Contact_Table_Iteration
    Contact_Choose
    Comparision_BW_Mailing_Billing_Address

ADF_REG-30
    [Tags]  Passed
    [Documentation]    *Functionality*
    ...    To verify whether the Contact Billing address is updated or not
    ${AccountName_Value}=     read excel data     Contact_Selection    ADF_REL-30     Account Select
    Set Global Variable  ${AccountName_Value}
    Common_Configure.Log_into_Salesforce
    Account_Choose
    Account_Billing_Address
    Updating_The_Billing_Address

ADF_REL-31

    [Tags]  QA_Demo
    [Documentation]    *Functionality*
    ...    To verify whether the donation contact role amount, when updating the amount value partial to full
    ...    *Test Steps*
    ...
    ...    1. Open the sandbox "test.salesforce.com"
    ...    2. Enter the valid username and password
    ...    3. Click ""Submit"" button
    ...    4. Navigates to "Donation" object
    ...    5. Click new button and then choose the record type
    ...    6. Click continue button
    ...    7. Choose the donor and account name and then enter the donation record details
    ...    8.Click save button
    ...    9. Scroll down to donation contact role VF page section
    ...    10. Click Edit contact roles button on VF page
    ...    11. Verfiy the expected result"
    ...
    ...    *Expected Result*
    ...
    ...    11.1 Donation contact role record should be created with name of Donor and the amount field should be updates as "Full"
    ...    11.2 New soft credit contact role record should \ be created \ from the donor's relaitionship viwer VF page

    #TestCase
    ${Contact_Role_Amount_V}=   read excel data  Donation       ADF_REL-31      ContactRole Amount
    Set Global Variable  ${Contact_Role_Amount_V}
    ${New_Contact_Role_V}=   read excel data  Donation       ADF_REL-31      ContactRole Value
    Set Global Variable  ${New_Contact_Role_V}
    ${DonationName_V}=   read excel data  Donation       ADF_REL-31      Donation Select
    Set Global Variable  ${DonationName_V}
    Common_Configure.Log_into_Salesforce
    Updating_the_Contact_Role_Amount
    Close Browser

ADF_REG-32

    [Tags]  Passed
    [Documentation]    *Functionality*
    ...    To verify whether the donation record is created with default designation or not
    ...

    ...    *Test Steps*
    #Test Case
    ${Don_Name_V}=   read excel data     Donation    ADF_REL-32    DonationName
    Set Global Variable  ${Don_Name_V}
    ${Don_Donor_V}=  read excel data  Donation   ADF_REL-32      Donor
    Set Global Variable  ${Don_Donor_V}
    ${Don_Amt_V}=    read excel data     Donation    ADF_REL-32    Amount
    Set Global Variable  ${Don_Amt_V}
    ${Don_Sourcecode_V}=    read excel data  Donation   ADF_REL-32     SourceCode
    Set Global Variable  ${Don_Sourcecode_V}
    Log_into_Salesforce
    Donation.Donation_Creation
    Verifying_Donation's_Desgination(Default)

ADF_REG-33

    [Tags]  Passed
    [Documentation]    *Functionality*
    ...    To verify whether the donation record is created with priamry campaign associated designation or not
    ...

    ...    *Test Steps*

    #Test Case

    ${Don_Name_V}=   read excel data     Donation    ADF_REL-33     DonationName
    Set Global Variable  ${Don_Name_V}
    ${Don_Donor_V}=  read excel data  Donation   ADF_REL-33     Donor
    Set Global Variable  ${Don_Donor_V}
    ${Don_Amt_V}=    read excel data     Donation    ADF_REL-33    Amount
    Set Global Variable  ${Don_Amt_V}
    ${Don_Sourcecode_V}=    read excel data  Donation   ADF_REL-33     SourceCode
    Set Global Variable  ${Don_Sourcecode_V}
    Log_into_Salesforce
    Donation.Donation_Creation
    Verifying_Donation's_Desgination(Primary_Campaign)

ADF_REG-34

    [Tags]  Passed
    [Documentation]    *Functionality*
    ...    To verify whether the donation name after updating the Donor Value
    ...

    ...    *Test Steps*

    #Test Case

    ${DonationName_V}=        read excel data  Donation   ADF_REL-34    Donation Select
    Set Global Variable    ${DonationName_V}
    ${Donor_update_Value}=        read excel data  Donation   ADF_REL-34    Donor
    Set Global Variable    ${Donor_update_Value}
    Log_into_Salesforce
    Donation_Choose
    Verifying_the_Donation_Name

ADF_REG-35

    [Tags]  Passed
    [Documentation]    *Functionality*
    ...    To verify whether the contact's associated Donation's  record types are updated as "Board Member" or not, while creating a classification record
    ...     Note: Classification record's 'Board Member Classification' = True

    ...    *Test Steps*

    ${ContactName_Value}=     read excel data     Contact_Selection    ADF_REL-35     Contact Select
    Set Global Variable  ${ContactName_Value}
    ${Classification_Value}=     read excel data     Contact_Selection    ADF_REL-35     Classfication
    Set Global Variable  ${Classification_Value}
    ${RecordID}=     read excel data     Contact_Selection    ADF_REL-35     Contact_Record Id
    Set Global Variable   ${RecordID}
    Log_into_Salesforce
    #Contact_Table_Iteration
    #Get_Donation_Records_Details_From_Contact_RelatedList
    Contact_Choose
    Classifcation_Record_Creation_From_Contact
    Verfiying_Donations_Recordtype_After_Classifcation_Record_Creation

ADF_REG-36

    [Tags]  Passed
    [Documentation]    *Functionality*
    ...    To verify whether the contact's associated Donation's  record types are updated as "Board Member" or not, while updating a classification record
    ...     Note: Classification record's 'Board Member Classification' = True

    ...    *Test Steps*

    ${ContactName_Value}=     read excel data     Contact_Selection    ADF_REL-36     Contact Select
    Set Global Variable  ${ContactName_Value}
    ${Classification_Value}=     read excel data     Contact_Selection    ADF_REL-36     Classfication
    Set Global Variable  ${Classification_Value}
    ${ExstingClassification}=     read excel data     Contact_Selection    ADF_REL-36     ExstingClassification
    Set Global Variable  ${ExstingClassification}
    ${RecordID}=     read excel data     Contact_Selection    ADF_REL-36     Contact_Record Id
    Set Global Variable   ${RecordID}
    Log_into_Salesforce
    Contact_Choose
    #Get_Donation_Records_Details_From_Contact_RelatedList
    Classifcation_Record_update_From_Contact
    Verfiying_Donations_Recordtype_After_Classifcation_Record_Creation

ADF_REG-37
    [Tags]  QA1_Demo
    [Documentation]    *Functionality*
    ...    To verify whether the contact's associated Donation's  record types are updated as "Board Member" or not, while updating a classification record
    ...     Note: Classification record's 'Board Member Classification' = True

    ...    *Test Steps*

    ${ContactName_Value}=     read excel data     Contact_Selection    ADF_REL-37     Contact Select
    Set Global Variable  ${ContactName_Value}
    ${Classification_Value}=     read excel data     Contact_Selection    ADF_REL-37     Classfication
    Set Global Variable  ${Classification_Value}
    ${ExstingClassification}=     read excel data     Contact_Selection    ADF_REL-37     ExstingClassification
    Set Global Variable  ${ExstingClassification}
    ${RecordID}=     read excel data     Contact_Selection    ADF_REL-36     Contact_Record Id
    Set Global Variable   ${RecordID}
    #Log_into_Salesforce
    Contact_Choose
    #Get_Donation_Records_Details_From_Contact_RelatedList
    Classifcation_Record_update_From_Contact
    Get_Donation_Records_Details_From_Contact_RelatedList

ADF_REG-38

     [Tags]  QA1_Demo
     [Documentation]  *Functionality*
    ...    To Verify the Communication preffernce field in ODP contact
    ...
    ...    *Test Steps*
    ...
    ...    1. Open the sandbox "test.salesforce.com"
    ...    2. Enter the valid username and password
    ...    3. Click ""Submit"" button
    ...    4. Navigates to "Contacy" object
    ...    5. Click new button and then choose the record type
    ...    6. Click continue button
    ...    7. Enter the contact record details
    ...    8. Click Save button
    ...    *Expected Result*
    ...
    ...    8.1 Communication prefference field should not be checked

    #TestCase
    ${Acc_Name_V}=    read_excel_data   Account     ADF_REL-38    AccountName
    set global variable  ${Acc_Name_V}
    ${Bill_St_V}=     read_excel_data   Account     ADF_REL-38     BillingStreet
    set global variable  ${Bill_St_V}
    ${Bill_City_V}=   read_excel_data   Account     ADF_REL-38     BillingCity
    set global variable  ${Bill_City_V}
    ${Bill_Code_V}=   read_excel_data   Account          ADF_REL-38     BillingZipCode
    set global variable  ${Bill_Code_V}
    ${Bill_State_V}=      read_excel_data   Account     ADF_REL-38      BillingState
    set global variable  ${Bill_State_V}
    ${Bill_Country_V}=    read_excel_data   Account      ADF_REL-38     BillingCountry
    set global variable  ${Bill_Country_V}
    ${ContactName_Value}=     read excel data     Account     ADF_REL-38    AccountName
    Set Global Variable  ${ContactName_Value}
    Log_into_Salesforce
    Organization_Account_Creation
    ODP_Contact_Choose
    #Set Selenium Implicit Wait  15s
    ODP_Communicationn_Prefference
    Close Browser

ADF_REG-39

    [Tags]  QA1_Demo
     [Documentation]  *Functionality*
    ...    TTo verify whether the Related address details are updated to the contact's mailing address fields or not
    ...    When a user click 'Make Primary' button on Related address record
    ...
    ...    *Test Steps*
    ...
    ...    1. Open the sandbox "test.salesforce.com"
    ...    2. Enter the valid username and password
    ...    3. Click ""Submit"" button
    ...    4. Navigates to "Contacy" object
    ...    5. Click new button and then choose the record type
    ...    6. Click continue button
    ...    7. Enter the contact record details
    ...    8. Click Save button
    ...    *Expected Result*
    ...
    ...    8.1 Communication prefference field should not be checked

    #TestCase
    ${RecordID}=     read excel data     Contact_Selection    ADF_REL-39     Contact_Record Id
    Set Global Variable   ${RecordID}
    ${ContactName_Value}=     read excel data     Contact_Selection    ADF_REL-39     Contact Select
    Set Global Variable  ${ContactName_Value}
    Log_into_Salesforce
    Contact_Choose
    Set Selenium Implicit Wait  15s
    MakePrimary_Address_From_Relatesd_Address_Record
    Wait Until Element Is Visible  ${Edit_Button}
    Get_Related_Address_Values
    Make_Primary_Address
    #Wait Until Element Is Visible  ${Edit_Button}
    Contact_Mailing_Address
    Click Element  ${Cancel}
    Should Be Equal  ${Mailing_Street_Value}    ${RA_Street}
    Should Be Equal  ${Mailing_City_Value}  ${RA_City}
    Should Be Equal  ${Mailing_State_Value}     ${RA_State}
    Should Be Equal  ${Mailing_Country_Value}   ${RA_Country}
    Should Be Equal  ${Mailing_ZipCode_Value}   ${RA_Code}
    #Verifying_the_ContactAddress_and_RelatedAddress_PrimaryAddress
    Close Browser

ADF_REG-40

    [Tags]  QA1_Demo
    [Documentation]  *Functionality*
    ...    TTo verify whether the campaign segment record is created or not
    ...

    ${Campaign_Segment_Name_V}=        read excel data  Campaign_Segment       ADF_REG-40      Campaign Segment Name
    Set Global Variable   ${Campaign_Segment_Name_V}
    ${Campaign_V}=        read excel data  Campaign_Segment       ADF_REG-40      Campaign
    Set Global Variable  ${Campaign_V}
    Log_into_Salesforce
    Campaign_Segment_Record_Creation
    Verfiying_the_Sourcecode_Value
    Close Browser



ADF_REG-41

    [Tags]  Passed
    [Documentation]    *Functionality*
    ...    To verify whether the duplicate donation contact role record is created or not
    ...
    ...    *Test Steps*
    ...
    ...    1. Open the sandbox "test.salesforce.com"
    ...    2. Enter the valid username and password
    ...    3. Click ""Submit"" button
    ...    4. Navigates to "Donation" object
    ...    5. Click new button and then choose the record type
    ...    6. Click continue button
    ...    7. Choose the donor and account name and then enter the donation record details
    ...    8.Click save button
    ...    9. Scroll down to donation contact role VF page section
    ...    10. Click Edit contact roles button on VF page
    ...    11. Verfiy the expected result"
    ...
    ...    *Expected Result*
    ...
    ...    11.1 Donation contact role record should be created with name of Donor and the amount field should be updates as "Full"
    ...    11.2 New soft credit contact role record should \ be created \ from the donor's relaitionship viwer VF page

    #TestCase

    ${DonationName_V}=        read excel data  Donation   ADF_REL-41    Donation Select
    Set Global Variable    ${DonationName_V}
    ${New_Contact_Role_V}=      read excel data  Donation   ADF_REL-41    ContactRole Value
    Set Global Variable    ${New_Contact_Role_V}
    Log_into_Salesforce
    Donation.Add_New_Single_Contact_Role
    Close Browser

ADF_REG-42

    [Tags]  Passed
    [Documentation]  *Funcationality*

    ...     International Advocacy contact creation from International Account by clicking the New button

    ${AccountName_Value}=        read excel data  Contact_Selection   ADF_REL-42    Account Select
    Set Global Variable    ${AccountName_Value}
    Log_into_Salesforce
    Account_Choose
    International_Contact_Creation_From_Account
    Contact Creation Without Salutation
    Verifying_the_International_Account

ADF_REG-43

      [Tags]  Passed
     [Documentation]  *Funcationality*

     ...        To verify the Find Duplicates VF pages

    ${FirstName_V}=    read_excel_data  Contact     ADF_REL-43    FirstName
    Set Global Variable   ${FirstName_V}
    ${LastName_V}=    read_excel_data  Contact      ADF_REL-43     LastName
    Set Global Variable     ${LastName_V}
    ${Salutation_V}=    read_excel_data  Contact      ADF_REL-43     Salutation
    Set Global Variable   ${Salutation_V}
    ${NickName_V}=    read_excel_data  Contact      ADF_REL-43    NickName
    Set Global Variable   ${NickName_V}
    ${SpouseName_V}=  read_excel_data  Contact     ADF_REL-43     SpouseName
    Set Global Variable  ${SpouseName_V}
    ${Mail_Street_V}=  read_excel_data  Contact     ADF_REL-43      MailingStreet
    Set Global Variable  ${Mail_Street_V}
    ${Mail_City_V}=   read_excel_data  Contact     ADF_REL-43   MailingCity
    set global variable  ${Mail_City_V}
    ${Mail_State_V}=  read_excel_data  Contact     ADF_REL-43    MailingState
    set global variable  ${Mail_State_V}
    ${Mail_Code_V}=   read_excel_data  Contact     ADF_REL-43     MailingZipCode
    set global variable  ${Mail_Code_V}
    ${Mail_Country_V}=    read_excel_data  Contact     ADF_REL-43     MailingCountry
    set global variable  ${Mail_Country_V}
    ${Primary_contact_V}=   read_excel_data  Contact_Selection     ADF_REL-43       Duplicate Contact
    set global variable  ${Primary_contact_V}
    ${ContactName_Value}=   read_excel_data  Contact_Selection     ADF_REL-43
    set global variable  ${ContactName_Value}
    Log_into_Salesforce
    Contact_Choose
    Get_The_Values_From_Contact_FindDuplcates_Verifiation
    Verifyng_FindDuplicates_VF_Page

ADF_REG-44

    [Tags]  Passed
     [Documentation]  *Funcationality*

     ...        To verify the Relationship type detail record is created or not

    ${FirstContact_V}=      read excel data     Relationship    ADF_REG-44      FirstContact
    Set Global Variable  ${FirstAccount_V}
    ${SecondContact_V}=      read excel data     Relationship    ADF_REG-44       SecondContact
    Set Global Variable  ${SecondContact_V}
    ${First_Relationship_V}=    read excel data     Relationship    ADF_REG-44       First Relationship
    Set Global Variable  ${First_Relationship_V}
    ${Second_Relationship_V}=     read excel data     Relationship    ADF_REG-44       Second Relationship
    Set Global Variable  ${Second_Relationship_V}
    ${Start_Date_V}=    read excel data     Relationship    ADF_REG-44      Start Date
    Set Global Variable  ${Start_Date_V}
    ${ObjectName}=      read excel data  Object_Selection   ADF_REG-44  Objects
    Set Global Variable  ${ObjectName}
    Log_into_Salesforce
    Obejct_Selection_Salesforce
    Account-Contact_Relationship_Type_Detail_Record_Creation
    Checkbox_Verification


ADF_REG-45

    [Tags]  Passed
     [Documentation]  *Funcationality*

      ...      To verify whether the Duplicate relationship record is created or not

    ${FirstAccount_V}=      read excel data     Relationship    ADF_REG-45      FirstAccount
    Set Global Variable  ${FirstAccount_V}
    ${SecondContact_V}=      read excel data     Relationship    ADF_REG-45      SecondContact
    Set Global Variable  ${SecondContact_V}
    ${First_Relationship_V}=    read excel data     Relationship    ADF_REG-45      First Relationship
    Set Global Variable  ${First_Relationship_V}
    ${Second_Relationship_V}=     read excel data     Relationship    ADF_REG-45      Second Relationship
    Set Global Variable  ${Second_Relationship_V}
    ${ObjectName}=      read excel data  Object_Selection   ADF_REG-45  Objects
    Set Global Variable  ${ObjectName}
    Log_into_Salesforce
    Obejct_Selection_Salesforce
    Account-Contact_Relationship_Type_Detail_Record_Creation
    Capture Page Screenshot
    Cancelling_the_Edit_Mode
    Close Browser

ADF_REG-46

    [Tags]  Passed
     [Documentation]  *Funcationality*

      ...      To verify whether the relationship record is created or not, when creating a record with first account record as household account

    ${FirstAccount_V}=      read excel data     Relationship    ADF_REG-46      FirstAccount
    Set Global Variable  ${FirstAccount_V}
    ${SecondAccount_V}=      read excel data     Relationship    ADF_REG-46      SecondAccount
    Set Global Variable  ${SecondAccount_V}
    ${First_Relationship_V}=    read excel data     Relationship    ADF_REG-46      First Relationship
    Set Global Variable  ${First_Relationship_V}
    ${Second_Relationship}=     read excel data     Relationship    ADF_REG-46      Second Relationship
    Set Global Variable  ${Second_Relationship}
    ${ObjectName}=      read excel data  Object_Selection   ADF_REG-46  Objects
    Set Global Variable  ${ObjectName}
    Log_into_Salesforce
    Obejct_Selection_Salesforce
    Account-Account_Relationship_Type_Detail_Record_Creation
    Cancelling_the_Edit_Mode

ADF_REG-47

    [Tags]  Passed
    [Documentation]  *Funcationality*

      ...      To verify whether the relationship record is created or not with same First and Second conatact/Account

    ${FirstContact_V}=      read excel data     Relationship    ADF_REG-47      FirstContact
    Set Global Variable     ${FirstContact_V}
    ${SecondContact_V}=      read excel data     Relationship    ADF_REG-47      SecondContact
    Set Global Variable  ${SecondContact_V}
    ${First_Relationship_V}=    read excel data     Relationship    ADF_REG-47      First Relationship
    Set Global Variable  ${First_Relationship_V}
    ${Second_Relationship}=     read excel data     Relationship    ADF_REG-47      Second Relationship
    Set Global Variable  ${Second_Relationship}
    ${ObjectName}=      read excel data  Object_Selection   ADF_REG-47  Objects
    Set Global Variable  ${ObjectName}
    Log_into_Salesforce
    Obejct_Selection_Salesforce
    Contact-Contact_Relationship_Type_Detail_Record_Creation
    Cancelling_the_Edit_Mode
    Close Browser

ADF_REG-48

    [Tags]  Passed
    [Documentation]    *Functionality*
    ...    To verify whether the contact's associated Donation's  record types are updated as "Board Member" or not, while creating a classification record
    ...     Note: Classification record's 'Board Member Classification' = False

    ...    *Test Steps*

    ${ContactName_Value}=     read excel data     Contact_Selection    ADF_REL-48     Contact Select
    Set Global Variable  ${ContactName_Value}
    ${Classification_Value}=     read excel data     Contact_Selection    ADF_REL-48     Classfication
    Set Global Variable  ${Classification_Value}
    ${ExstingClassification}=     read excel data     Contact_Selection    ADF_REL-48     ExstingClassification
    Set Global Variable  ${ExstingClassification}
    ${RecordID}=     read excel data     Contact_Selection    ADF_REL-48     Contact_Record Id
    Set Global Variable   ${RecordID}
    Log_into_Salesforce
    Contact_Choose
    Classifcation_Record_Creation_From_Contact
    Verfiying_Donations_Recordtype_Other_Classifcation_Record_Creation
    Close Browser

ADF_REG-49

    [Tags]  Passed
    [Documentation]    *Functionality*
    ...    To verify whether the Household Contact/Account record is delelted or not, when contact/Account record has Donation
    ...

    ...    *Test Steps*

    ${ContactName_Value}=     read excel data     Contact_Selection    ADF_REL-49     Contact Select
    Set Global Variable  ${ContactName_Value}
    Log_into_Salesforce
    Contact_Choose
    Verifying_the_Contact_Record_Deletion
    Account_Choose
    Verifying_the_Account_Record_Deletion
    Close Browser

ADF_REG-50

    [Tags]  Passed
    [Documentation]    *Functionality*
    ...    To verify whether the Household Account record is delelted or not, when last household contact record is deleted
    ...

    ...    *Test Steps*
    ${ContactName_Value}=     read excel data     Contact_Selection    ADF_REL-50     Contact Select
    Set Global Variable  ${ContactName_Value}
    Log_into_Salesforce
    Contact_Choose
    Verifying_the_Contact_Record_Deletion

ADF_REG-51

    [Tags]  Passed
    [Documentation]    *Functionality*
    ...    To verify whether the ODP contact record deletion or not
    ...

    ...    *Test Steps*

    ${ContactName_Value}=     read excel data     Contact_Selection    ADF_REL-51     Contact Select
    Set Global Variable  ${ContactName_Value}
    Contact_Choose
    Verifying_the_ODPContact_Record_Deletion


ADF_REG-52

      [Tags]  Passed
    [Documentation]    *Functionality*
    ...    To verify whether the Donatoin's reffered CampaignSement and Received donation records are delelted or not
    ...
    ...    *Test Steps*

    #Log_into_Salesforce
    ${DonationName_V}=     read excel data     Donation    ADF_REL-51     Donation Select
    Set Global Variable  ${DonationName_V}
    Donation_Choose
    Verifying_the_CampaignSegment_Record_Deletion_From_Donation
    Verifying_the_Received_Donation_Record_Deletion


ADF_REG-53

      [Tags]  Passed
    [Documentation]    *Functionality*
    ...    To verify whether the Donation's reffered Desgination records are delelted or not
    ...

    ...    *Test Steps*

    #Log_into_Salesforce
    Designation_Record_Choose
    Verifying_the_Desingation_Record_Deletion
    Close Window

ADF_REG-54

    [Tags]  Passed
    [Documentation]    *Functionality*
    ...    To verify whether the Designation record is are created or not
    ...

    ...    *Test Steps*

    ${DesignationName_V}=     read excel data     Designation    ADF_REL-54     Contact Select
    Set Global Variable  ${DesignationName_V}
    Log_into_Salesforce
    Obejct_Selection_Salesforce
    Designation_Record_Creation


