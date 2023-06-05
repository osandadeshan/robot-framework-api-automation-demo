*** Settings ***
Resource        BaseTest.robot


*** Test Cases ***
Example POST Request
    [Documentation]    This is a sample for POST request automation
    [Tags]    Smoke    POST

    Create Session With Authentication And No Other Headers    POST_API
    ${payload}    Create Dictionary    title=Robot Framework    body=Robot Framework API Automation using Requests Library    userId=1
    ${response}    Post On Session    POST_API    /posts    json=${payload}
    Log    ${response.content}
    Should Be Equal As Strings    ${response.status_code}    201
    ${json_data}    Set Variable    ${response.json()}
    ${title_value}    Set Variable    ${json_data['title']}
    Should Be Equal As Strings    ${title_value}    Robot Framework
