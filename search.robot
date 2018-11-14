*** Settings ***
Library    SeleniumLibrary
# Resource    ./KeyWords.txt
Test Setup    Open Chrome Browser
Test Teardown    Close Browser

*** Test Cases ***
KKT-1-1 Search Singer
    Wait Until KKBOX HomePage Show
    Input Text For Search    X Japan
    Click Search
    Tablist Should Show    歌手
    Click Tablist Element    歌手
    Element Text Should Be   xpath://*[@id="search-page"]/div[4]/div[2]/div/div[1]/div/div[2]/h3/a    X JAPAN

KKT-1-2 Search Song
    Wait Until KKBOX HomePage Show
    Input Text For Search    完全感覺Dreamer
    Click Search
    Tablist Should Show    歌曲
    Click Tablist Element    歌曲
    Element Text Should Be   xpath://*[@id="search-page"]/div[4]/div[2]/div/div[1]/table/tbody/tr/td[2]/a    完全感覚Dreamer
    
KKT-1-3 Search Songlist
    Wait Until KKBOX HomePage Show
    Input Text For Search    藍井艾露
    Click Search
    Tablist Should Show    歌單
    Click Tablist Element    歌單
    Element Text Should Be    xpath://*[@id="search-page"]/div[4]/div[1]/div/div[1]/div/a/div[1]/span    藍井艾露 (Eir Aoi)
    Element Text Should Be    xpath://*[@id="search-page"]/div[4]/div[1]/div/div[1]/div/div/h3/a    藍井艾露 (Eir Aoi) 歷年精選

KKT-1-4 Search Without Input
    Wait Until KKBOX HomePage Show
    Click Search
    Element Should Not Be Visible    xpath://*[contains(@class, 'tablist')]
    Element Should Be Visible    xpath://*[contains(@class, 'slider_content')]/h5[contains(text(), '直擊每個音樂的美好瞬間。')]

KKT-1-5 Search But Got Nothing
    Wait Until KKBOX HomePage Show
    Input Text For Search    spadkqwpdokq
    Click Search
    Element Should Be Visible    xpath://*[contains(@class, 'state-main')]/h1[contains(text(), '找不到符合「spadkqwpdokq」的搜尋結果')]

KKT-1-6 Search With Exceed Max Length Input
    Wait Until KKBOX HomePage Show
    Input Text For Search    012345678901234567890123456789012345678901234567890
    Click Search
    Searchbar Text Should Be   01234567890123456789012345678901234567890123456789

KKT-1-7 Search With Max Length Input
    Wait Until KKBOX HomePage Show
    Input Text For Search    01234567890123456789012345678901234567890123456789
    Click Search
    Searchbar Text Should Be    01234567890123456789012345678901234567890123456789

*** KeyWords ***
Open Chrome Browser
    Open Browser    https://www.kkbox.com/tw/tc/index.html    Chrome

Wait Until KKBOX HomePage Show
    Wait Until Element Is Visible    xpath://*[@id="pm-web-header"]/div/div[1]/a
    Wait Until Element Is Visible    name:word

Click Search
    Click Element    xpath://*[@id="pm-web-header"]/div/div[2]/form/button

Input Text For Search
    [Arguments]  ${text}
    Input Text    name:word   ${text}

Tablist Should Show
    [Arguments]  ${text}
    Element Should Be Visible    xpath://*[contains(@class, 'tablist')]//*[contains(text(), '${text}')]

Click Tablist Element
    [Arguments]  ${text}
    Click Element    xpath://*[contains(@class, 'tablist')]//*[contains(text(), '${text}')]

Searchbar Text Should Be
    [Arguments]  ${text}
    Textfield Value Should Be    name:word    ${text}
