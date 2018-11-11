*** Settings ***
Library    SeleniumLibrary
Resource    ./KeyWords.txt
Suite Setup    Open Chrome Browser
Suite Teardown    Close Browser

*** Test Cases ***
Search Singer
    Wait KKBOX HomePage
    Input Text    name:word    X Japan
    Click Element    xpath://*[@id="pm-web-header"]/div/div[2]/form/button
    Element Text Should Be    xpath://*[@id="search-page"]/div[3]/div/ul/li[3]/a    歌手
    Click Element    xpath://*[@id="search-page"]/div[3]/div/ul/li[3]/a
    Element Text Should Be   xpath://*[@id="search-page"]/div[4]/div[2]/div/div[1]/div/div[2]/h3/a    X JAPAN

