*** Settings ***
Library    SeleniumLibrary


*** Keywords ***
Abrir site da google
     Open Browser      https://www.google.com.br/  chrome
     Maximize Browser Window
fechar navegador    
    Close Browser
Abrir site globo
    Open Browser     https://www.globo.com/ chrome

*** Test Cases ***
Cenário 1: Teste abrir site da google    
    Abrir site da google
    fechar navegador
cenário 2: Teste de abrir site globo
    Abrir site globo
    fechar navegador
