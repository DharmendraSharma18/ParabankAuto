*** Settings ***
Documentation    Suite description
Resource    Keywords/ParaBank_Keywords.robot
Resource    Test_Data_and_OR/OR_Parabank.robot
Resource    Test_Data_and_OR/TestData_ParaBank.robot

*** Test Cases ***

TC03 Verify features avaialble to logged in user
    kw_Launch_Parabank
    kw_Login_Parabank_User  ${td_User4}  Test1234
    kw_Verify_Available_Features_LoggedIn_User
    kw_Open_New_Account     CHECKING     12345
    Close Browser