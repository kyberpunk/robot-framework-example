*** Settings ***
Library   Browser
Resource  ../resources/variables.resource

*** Keywords ***
Setup Browser
    New Context  recordVideo={'dir':'videos'}

Get greeting for name ${name}
    New Page    ${DEFAULT_URL}
    Type Text    ${SEL_NAME_INPUT}    ${name}
    Click   ${SEL_SUBMIT_BUTTON}

Greeting is ${expected}
    ${greeting}    Get Text    ${SEL_GREETING_TEXT}
    Should Be Equal As Strings    ${greeting}    ${expected}

Check greeting for name
    [Arguments]    ${name}
    Get greeting for name ${name}
    Greeting is Hi ${name}!