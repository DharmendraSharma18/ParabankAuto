*** Settings ***
Documentation    Suite description
Resource    Keywords/ParaBank_Keywords.robot
Resource    Test_Data_and_OR/OR_Parabank.robot
Resource    Test_Data_and_OR/TestData_ParaBank.robot

*** Test Cases ***
TC 02 Recover Login info
    kw_Launch_Parabank
    log to console  "Recover user info"
    kw_Recover_forgotten_passwd     ${td_User1_Details}



