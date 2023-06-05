*** Settings ***
Resource        BaseTest.robot


*** Test Cases ***
Example DELETE Request
    [Documentation]    This is a sample for DELETE request automation
    [Tags]    Regression    DELETE

    Create Session With Authentication And No Other Headers    DELETE_API
    ${response}    GET On Session    DELETE_API    /posts/2
    Log    ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
