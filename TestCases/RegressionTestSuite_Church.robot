*** Settings ***
Documentation    Suite description
Library  SeleniumLibrary
#Library  pabot.PabotLib
#Library  AllureReportLibrary
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
    [Tags]  DemoQA
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
    #Primary_Contact_With_New_ContactInformation
    #Church_Alliance_Signup_PrimaryInfo_With_CreditCard
    CA_Membership_Record_Creation_EmailVerification
    #Welcome_Email_Verification_CA
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

ADFM_CA_07
    [Tags]  QA_Demo

    Log_into_Salesforce
    #Switch to Lightning
    Set Selenium Implicit Wait  10s
    Wait Until Element Is Visible  xpath=//nav[@class='appLauncher slds-context-bar__icon-action']//button[@type='button']
    sleep  3s
    click element  xpath=//nav[@class='appLauncher slds-context-bar__icon-action']//button[@type='button']
    Sleep   3s
    #click link  Sales
    click element  xpath=//span[contains(text(),'Leads')]
    #click element  xpath=//a[contains(text(),"Sales")]
    #wait until element is visible  xpath=//span[@class='slds-truncate'][contains(text(),'Leads')]
    #Click Element  xpath=//span[@class='slds-truncate'][contains(text(),'Leads')]
    Wait Until Element Is Visible  xpath=//div[@title='New']
    Click Element  xpath=//div[@title='New']
    #Click Element    //div[@class="slds-r5"]
    #Click Element    //p[@id="visibleDescription_07p7F000000RAIdQAO"]
    #Click Element    //svg[@class="slds-icon slds-icon-text-default slds-icon_xx-small"]
    #Click Element    xpath=(//span)[44]
    #Click Link    xpath=(//a[@href="javascript:void(0);"])[13]
    Sleep  5s
    #Select From List By Value    xpath=//a[contains(.,"--None--")]    @{Salutation}[2]
    Input Text    css=input[placeholder='Last Name']     Test Demo Lead
    Set Selenium Implicit Wait  2s
    #scroll down   xpath=.//label/span[1][text()='Company']//following::input[@required='']
    Input Text     xpath=.//label/span[1][text()='Company']//following::input[@required='']   MST_QA
    #Click Element    //div[@class="full forcePageBlock forceRecordLayout"]
    #Input Text    //input[@id="454:838;a"]    60000
    Click Element    xpath=//button[@title='Save']


ADFM_CA_08

      [Tags]  Amb
      Open Browser  	https://qarel-adflegalrv2.cs92.force.com/AmbassadorCommunity        chrome
      Maximize Browser Window
      Wait Until Element Is Visible  xpath=//input[@id='adf:memberlogin:useremail']
      Input Text  xpath=//input[@id='adf:memberlogin:useremail']    testamb1
      Input Text  xpath=//input[@id='adf:memberlogin:password']     Admin123
      Click Element  xpath=//input[@id='adf:memberlogin:j_id30']
      set selenium implicit wait  20s
      sleep  10s
      #Click Element    //button[@class="slds-container_fluid slds-button slds-button--reset slds-truncate"]
      Click Element  xpath=//button[contains(text(),'My Impact')]
      sleep  10s
      Click Element    Xpath=.//a/span[text()='My Contacts']
      Log  Pass

















