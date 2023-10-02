*** Settings ***
Library    SeleniumLibrary

*** Variables ***
#Dados do teste
${NomedaMusica}        Jessé Aguiar Eu Não Desisto

#Variáveis de Configuração
${URL}            https://www.youtube.com/
${Browser}        chrome

#Elementos
${Input_Pesquisa}     //input[@id="search"]
${Button_Pesquisa}    //button[@id="search-icon-legacy"]
${Primeiro}           (//yt-formatted-string[@class="style-scope ytd-video-renderer"])[1]
${Button_Pular}       //span[contains(@class,'ytp-ad-skip-button-icon')]
${Prova}              //yt-formatted-string[@id="info"]
*** Keywords ***
Dado que eu acesso o site do youtube
    Open Browser    ${URL}  ${Browser} 
    Maximize Browser Window   
Quando digito o nome da música
    Input Text    locator=${Input_Pesquisa}     text=${NomedaMusica} 
    Sleep    2

E clico no botão buscar
    Click Element    locator=${Button_Pesquisa} 
    Sleep    2
E clico na primeira opção da lista
    Click Element    locator=${Primeiro} 
    Sleep    10
E clico no botão pular anúncio
    Click Element    locator=${Button_Pular}
    Sleep    5
Então o video é executado
    Element Should Be Visible    locator=${Prova}
    Sleep    1
    Close Browser
*** Test Cases ***
Cenário 01: Exucutar video no site do youtube
    Dado que eu acesso o site do youtube
    Quando digito o nome da música
    E clico no botão buscar
    E clico na primeira opção da lista
    E clico no botão pular anúncio
    Então o video é executado
