*** Settings ***
Documentation    Suite description
#Library     Selenium2Library
Library   ExtendedSelenium2Library
Resource  ../Salesforce_Objects/Donation.robot


*** Variables ***
${UsernameElement}      Id=username
${PasswordElement}      Id=password
${Submit}       Id=Login
${URL} =  https://test.salesforce.com
${Contact_Tab_E}    Id=Contact_Tab

Relationship_Viewer_VF_Page

${Contact-Contact_VF_iframe_E}  title=sessionserver
${Frame_ID_VF_E}    id=066f4000001HaES
${Column_Header_CC_E}    xpath.//*[@id='tableAccount1']/thead/tr/th
${TestTest_E}   xpath=.//*[@id='pg:formid:block1:repeatAccount:3:account']/td[1]
${Contact_Softcrdeit_Checkbox_E}    xpath=.//*[@id='pg:formid:block1:repeatAccount:${i}:j_id39']/img
${i}

${New_single_Gift_E}    name=new_single_gift

*** Test Cases ***

TC_1
    ExtendedSelenium2Library.Open Browser	    ${URL}    chrome
    ExtendedSelenium2Library.Maximize Browser Window
    ExtendedSelenium2Library.Input Text  ${UsernameElement}     nallavan@mstsolutions.com.qarel
    ExtendedSelenium2Library.Input Text  ${PasswordElement}      metasoft@123
    ExtendedSelenium2Library.click button  ${Submit}
    ExtendedSelenium2Library.Wait Until Element Is Visible    ${Contact_Tab_E}
    ExtendedSelenium2Library.Click Element    ${Contact_Tab_E}
    Sleep    10s
    ExtendedSelenium2Library.Click Element   xpath=.//*[@id='bodyCell']/div[3]/div[1]/div/div[2]/table/tbody/tr[2]/th/a
    ExtendedSelenium2Library.Wait Until Element Is Visible    name=edit
    Contact_Relationship_Viewer1
    Sleep   10s
    Donation_SoftCredit_Role_Verification_From_ContactVF

*** Keywords ***

Contact_Relationship_Viewer1

    ExtendedSelenium2Library.Select Frame  ${frame_id_vf_e}
    ExtendedSelenium2Library.Wait Until Element Is Visible  id=pg:formid:block1
    @{DonationRole}=    Create List
    ExtendedSelenium2Library.Wait Until Element Is Visible  xpath=.//*[@id='tableAccount1']/tbody/tr
    ${Row Count}=     ExtendedSelenium2Library.Get Matching Xpath Count    xpath=.//*[@id='tableAccount1']/tbody/tr
    ${rc_int}=   Convert To Integer    ${Row Count}
    ${Column_Count}=    ExtendedSelenium2Library.Get Matching Xpath Count    ${Column_Header_CC_E}
    ${cc_int}=    Convert To Integer    ${Column_Count}
    : FOR    ${i}    IN RANGE    1    ${rc_int}+1
    \    Log    ${i}
    \    Set Global Variable   ${i}
    \    ${Contact_Softcrdetit}=  ExtendedSelenium2Library.Get Text   ${Contact_Softcrdeit_Checkbox_E}
    \    Run Keyword If    "${Contact_Softcrdetit}"=="${True}"   Get_Value_From_Table
    \    Exit For Loop If  ${i}>>${rc_int}+1
    Sleep  10s
    ExtendedSelenium2Library.scroll element into view  xpath=.//*[@id='0031b00000RyUIX_RelatedOpportunityList']/div[1]/div
    ExtendedSelenium2Library.Capture Page Screenshot
    ExtendedSelenium2Library.Click Element  ${contact_tab_e}
    ExtendedSelenium2Library.Click Element  xpath=.//*[@id='0031b00000RyUIX_RelatedOpportunityList']/div[1]/div/div[1]/table/tbody/tr/td[2]/input[1]
    ExtendedSelenium2Library.Wait Until Element Is Visible  ${Amount_E}
    ExtendedSelenium2Library.Input Text    ${Amount_E}    5000
    ExtendedSelenium2Library.Input Text    ${SourceCode_E}    10000878
    ExtendedSelenium2Library.Click Element    ${Continue_E}
    Donation_SoftCredit_Role_Verification_From_ContactVF
