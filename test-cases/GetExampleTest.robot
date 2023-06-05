*** Settings ***
Resource        BaseTest.robot


*** Test Cases ***
Example GET Request
    [Documentation]    This is a sample for GET request automation
    [Tags]    Smoke    GET

    Create Session With Authentication And No Other Headers    GET_API
    ${response}    GET On Session    GET_API    /posts
    Log    ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
