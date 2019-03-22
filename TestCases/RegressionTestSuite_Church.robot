*** Settings ***
Documentation    Suite description
Library  SeleniumLibrary
Library  pabot.PabotLib
Library  AllureReportLibrary
Resource  ../Common_Configuration/Common_Configure.robot
Resource  ../Salesforce_Objects/Contact.robot
Resource  ../Salesforce_Objects/Account.robot
Resource  ../Salesforce_Objects/Applicant_Detail.robot
Resource  ../Salesforce_Objects/Church_Signup.robot
#Library     ../CustomLibrary/Contact.py
Library     ../CustomLibrary/ExcelUtilities.py
Resource    ../TestCases/TestSuiteVariables.robot
#Resource   ../TestCases/TestSuiteVariables.robot


*** Variables ***
${HoH_Error_Alert}    The Head of Household flag should be true for this Contact record!!!


*** Test Cases ***

ADF_CA_01

    [Documentation]
    [Tags]  Demo
    ${ChurchName_V}=    read_excel_data   Church_Alliance     TC5     Church Name
    set global variable  ${ChurchName_V}
    ${Church_Address_V}=    read excel data  Church_Alliance  TC5     Address
    set global variable  ${Church_Address_V}
    ${Church_Address2_v}=    read_excel_data   Church_Alliance     TC5     Address 2
    set global variable  ${church_address2_v}
    ${Church_City_V}=    read_excel_data   Church_Alliance     TC5     City
    set global variable  ${Church_City_V}
    ${Church_State_V}=    read_excel_data   Church_Alliance     TC5     State
    set global variable  ${Church_State_V}
    ${Church_Zip_V}=    read_excel_data   Church_Alliance     TC5     Zip code
    set global variable  ${Church_Zip_V}
    ${Church_Email_V}=    read_excel_data   Church_Alliance     TC5     Church Email
    set global variable  ${Church_Email_V}
    ${Church_Phone_V}=    read_excel_data   Church_Alliance     TC5     Church Phone
    set global variable   ${Church_Phone_V}
    ${Church_Denomination_V}=    read_excel_data   Church_Alliance     TC5     Denominatoin
    set global variable  ${Church_Denomination_V}
    ${HowDidYouAboutus_V}=    read_excel_data   Church_Alliance     TC5     How Did You Hear About US
    set global variable  ${HowDidYouAboutus_V}
    ${Church_Size_V}=    read excel data  Church_Alliance    TC5     Church Size
    set global variable  ${Church_Size_V}
    ${Lead_Title_V}=    read_excel_data   Church_Alliance     TC5     Lead Title
    set global variable  ${Lead_Title_V}
    ${Lead_FirstName_V}=    read_excel_data   Church_Alliance     TC5     Lead First Name
    set global variable  ${Lead_FirstName_V}
    ${Lead_LastName_V}=    read_excel_data   Church_Alliance     TC5     Lead Last Name
    set global variable  ${Lead_LastName_V}
    ${Lead_Email_V}=    read_excel_data   Church_Alliance     TC5     Lead Email
    set global variable  ${Lead_Email_V}
    ${Lead_Phone_V}=    read_excel_data   Church_Alliance     TC5     Lead Phone
    set global variable  ${Lead_Phone_V}
    ${Primary_Title_V}=    read_excel_data   Church_Alliance     TC5     Primary Title
    set global variable  ${Primary_Title_V}
    ${Primary_FirstName_V}=    read_excel_data   Church_Alliance     TC5     Primary First Name
    set global variable  ${Primary_FirstName_V}
    ${Primary_LastName_V}=    read_excel_data   Church_Alliance     TC5     Primary Last Name
    set global variable  ${Primary_LastName_V}
    ${Primary_Phone_V}=    read_excel_data   Church_Alliance     TC5     Primary Phone
    set global variable  ${Primary_Phone_V}
    ${Primary_Email_V}=    read_excel_data   Church_Alliance     TC5     Primary Email
    set global variable  ${Primary_Email_V}
    ${Attorney_FirstName_V}=    read excel data  Church_Alliance  TC5       Attorney First Name
    set global variable  ${Attorney_FirstName_V}
    ${Attorney_LastName_V}=    read excel data  Church_Alliance  TC5       Attorney Last Name
    set global variable  ${Attorney_LastName_V}
    ${Attorney_City_V}=      read excel data  Church_Alliance  TC5       Attorney City
    set global variable  ${Attorney_City_V}
    ${Attorney_State_V}=      read excel data  Church_Alliance  TC5       Attorney State
    set global variable  ${Attorney_State_V}
    ${Payer_FN_V}=    read excel data  Church_Alliance  TC5       Payer First Name
    set global variable   ${Payer_FN_V}
    ${Payer_LN_V}=    read excel data  Church_Alliance  TC5       Payer Last Name
    set global variable   ${Payer_LN_V}
    ${Payer_Address_V}=     read excel data  Church_Alliance  TC5       Payer Address
    set global variable   ${Payer_Address_V}
    ${Payer_City_V}=    read excel data  Church_Alliance  TC5       Payer City
    set global variable  ${Payer_City_V}
    ${Payer_State_V}=    read excel data  Church_Alliance  TC5       Payer State
    set global variable   ${Payer_State_V}
    ${Payer_Zipcode_v}=     read excel data  Church_Alliance    TC5     PayerZip Code
    set global variable   ${Payer_Zipcode_v}
    ${Church_CardNo_V}=     read excel data  Church_Alliance    TC5     Card No
    set global variable   ${Church_CardNo_V}
    ${Church_CardName_V}=     read excel data  Church_Alliance    TC5     Card Name
    set global variable   ${Church_CardName_V}
    ${Church_CY_V}=     read excel data  Church_Alliance    TC5     Card Year
    set global variable   ${Church_CY_V}
    ${Church_SecuirtyCode_V}=     read excel data  Church_Alliance    TC5     Security Code
    set global variable   ${Church_SecuirtyCode_V}
    #Church_Alliance_Signup_PrimaryInfo_With_CreditCard
    Log_into_Salesforce
    Set Selenium Implicit Wait  10s
    Organization_Account_Selection
    ODP_Contact_Choose
    Church_ODP_Contact_Verification
    Set Selenium Implicit Wait  10s
    Primary_Applicant_Record_Selection
    Verifying_The_Primary_Applicant_Detail_record
    Household_Contact_Selection_Primary
    Church_Primary_Household_Contact_Verification
    Close Browser

ADF_CA_02

    Church_Alliance_Signup_Promo_Code
    Log_into_Salesforce
    Set Selenium Implicit Wait  10s
    Organization_Account_Selection
    ODP_Contact_Choose
    Church_ODP_Contact_Verification
    Primary_Applicant_Record_Selection
    Verifying_The_Primary_Applicant_Detail_record
    Household_Contact_Selection_Primary
    Church_Primary_Household_Contact_Verification
    Close Browser

ADF_CA_03

    Church_Alliance_Signup_Leadinfo
     Log_into_Salesforce
    Set Selenium Implicit Wait  10s
    Organization_Account_Selection
    ODP_Contact_Choose
    Church_ODP_Contact_Verification
    Primary_Applicant_Record_Selection
    Verifying_The_Primary_Applicant_Detail_record
    Household_Contact_Selection_Primary
    Church_Primary_Household_Contact_Verification
    Close Browser


ADF_CA_04

    Church_Alliance_Signup_ACH
    Log_into_Salesforce
    Set Selenium Implicit Wait  10s
    Organization_Account_Selection
    ODP_Contact_Choose
    Church_ODP_Contact_Verification
    Primary_Applicant_Record_Selection
    Verifying_The_Primary_Applicant_Detail_record
    Household_Contact_Selection_Primary
    Church_Primary_Household_Contact_Verification
    Close Browser

ADF_CA_05

    Church_Alliance_Signup_ACH_Promocode
    Log_into_Salesforce
    Set Selenium Implicit Wait  10s
    Organization_Account_Selection
    ODP_Contact_Choose
    Church_ODP_Contact_Verification
    Primary_Applicant_Record_Selection
    Verifying_The_Primary_Applicant_Detail_record
    Household_Contact_Selection_Primary
    Church_Primary_Household_Contact_Verification
    Close Browser


ADFM_CA_06

    Church_Alliance_Signup_ACH_Promocode
    Log_into_Salesforce
    Set Selenium Implicit Wait  10s
    Organization_Account_Selection
    ODP_Contact_Choose
    Church_ODP_Contact_Verification
    Primary_Applicant_Record_Selection
    Verifying_The_Primary_Applicant_Detail_record
    Household_Contact_Selection_Primary
    Church_Primary_Household_Contact_Verification
    Close Browser

