*** Settings ***
Documentation    Suite description
Library  Selenium2Library

*** Variables ***



*** Keywords ***

Scroll Page To Location
    [Arguments]    ${x_location}    ${y_location}
    Execute JavaScript    window.scrollTo(${x_location},${y_location})

#Scroll_Page
    #Scroll Element Into View  xpath=//*[@id='0031b00000RyUIX_RelatedOpportunityList']/div[1]/div