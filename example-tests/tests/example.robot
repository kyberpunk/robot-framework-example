*** Settings ***
Library   Browser
Library   RequestsLibrary
Library    String
Resource  ../resources/common.resource
Resource  ../resources/variables.resource

Suite Setup    Setup Browser
Test Setup     Log    This is test setup!

*** Test Cases ***
Greeting contains the name (simple)
    [Tags]    GUI
    New Page    ${DEFAULT_URL}
    Type Text    ${SEL_NAME_INPUT}    Vit
    Click   ${SEL_SUBMIT_BUTTON}
    ${greeting}    Get Text    ${SEL_GREETING_TEXT}
    Should Be Equal As Strings    ${greeting}    Hi Vit!

Greeting contains the name (behavior driven)
    [Tags]    GUI
    When Get greeting for name Vit
    Then Greeting is Hi Vit!

Test greetings for different names (data driven)
    [Template]    Check greeting for name
    Vit
    Karel
    Vit Holasek
    !@#

Send GET request with arguments
    [Tags]    API
    ${response}    When GET    http://httpbin.org/get    params=value=test
                   Then Status Should Be    200    ${response}
                   And Should Be Equal As Strings    test    ${response.json()}[args][value]
