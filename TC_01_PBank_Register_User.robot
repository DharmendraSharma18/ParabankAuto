*** Settings ***
Resource    Keywords/ParaBank_Keywords.robot
Resource    Test_Data_and_OR/OR_Parabank.robot
Resource    Test_Data_and_OR/TestData_ParaBank.robot

*** Test Cases ***

Register New User
    [Tags]    Functional
    log to console  execute 1st test case
    kw_Launch_Parabank
    kw_To_Register_Page
    kw_Enter_User_Details   ${td_User_Details_2}
    kw_submit_User_Rgstr    ${td_User_Details_2}[8]

