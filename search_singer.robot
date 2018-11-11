*** Settings ***
Library    SeleniumLibrary
Resource    ./KeyWords.txt
Test Setup    Open Chrome Browser
Test Teardown    Close Browser

*** Test Cases ***
KKT-1-1 Search Singer
    Wait KKBOX HomePage
    Input Text    name:word    X Japan
    Click Search
    Element Text Should Be    xpath://*[contains(@class, 'tablist')]//*[contains(text(), '歌手')]    歌手
    Click Element    xpath://*[contains(@class, 'tablist')]//*[contains(text(), '歌手')]
    Element Text Should Be   xpath://*[@id="search-page"]/div[4]/div[2]/div/div[1]/div/div[2]/h3/a    X JAPAN

KKT-1-2 Search Song
    Wait KKBOX HomePage
    Input Text    name:word    完全感覺Dreamer
    Click Search
    Element Text Should Be    xpath://*[contains(@class, 'tablist')]//*[contains(text(), '歌曲')]    歌曲
    Click Element    xpath://*[contains(@class, 'tablist')]//*[contains(text(), '歌曲')]
    Element Text Should Be   xpath://*[@id="search-page"]/div[4]/div[2]/div/div[1]/table/tbody/tr/td[2]/a    完全感覚Dreamer
    
KKT-1-3 Search Songlist
    Wait KKBOX HomePage
    Input Text    name:word    藍井艾露
    Click Search
    Element Text Should Be    xpath://*[contains(@class, 'tablist')]//*[contains(text(), '歌單')]   歌單
    Click Element    xpath://*[contains(@class, 'tablist')]//*[contains(text(), '歌單')]
    Element Text Should Be    xpath://*[@id="search-page"]/div[4]/div[1]/div/div[1]/div/a/div[1]/span    藍井艾露 (Eir Aoi)
    Element Text Should Be    xpath://*[@id="search-page"]/div[4]/div[1]/div/div[1]/div/div/h3/a    藍井艾露 (Eir Aoi) 歷年精選

