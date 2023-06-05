*** Settings ***
Resource        BaseTest.robot


*** Test Cases ***
Example PUT Request
    [Documentation]    This is a sample for PUT request automation
    [Tags]    Regression    PUT

    Create Session With Authentication And No Other Headers    PUT_API
    ${payload}    Create Dictionary    title=Robot Framework    body=Robot Framework API Automation using Requests Library    userId=1
    ${response}    PUT On Session    PUT_API    /posts/1    json=${payload}
    Log    ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
    ${json_data}    Set Variable    ${response.json()}
    ${title_value}    Set Variable    ${json_data['title']}
    Should Be Equal As Strings    ${title_value}    Robot Framework
