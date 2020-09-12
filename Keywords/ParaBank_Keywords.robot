*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary
Library     Collections
Resource    TestData_ParaBank.robot
Resource    OR_Parabank.robot


*** Keywords ***
## To open Parabank Website

kw_Launch_Parabank
    open browser  ${TD_HOME_URL}  chrome
    wait until page contains element  ${OR_Parabank_Logo}  10s     error='Parabank portal not opened'
    log to console  "Parabank Home page opened"

kw_Login_Parabank_User
    [Arguments]     ${Username}     ${Password}
    page should contain element  ${OR_Custm_Login_Label}
    input text  ${OR_Username}  ${Username}
    input password  ${OR_Password}  ${Password}
    click button  ${OR_LogIn_Btn}

## To register a new user
kw_To_Register_Page
    click element  ${OR_Register}
    wait until page contains element    ${OR_Register_Pg_Title}  5s     error="Register Page not opened"
    log to console  "Register page opened"
# To enter new user details
kw_Enter_User_Details
    [Arguments]           ${New_User_Details}
    page should contain element  ${OR_Register_Pg_Title}    error='Not on Register Page'
    #page should contain     //div[@id='rightPanel']/p    ${td_rgstr_Pg_Text}
    page should contain   ${td_rgstr_Pg_Text}

    ${length}=    get length  ${OR_New_Usr_Lctr_List}
    :FOR  ${i}  IN RANGE    0  ${length}
    \   ${value}=     get from list  ${New_User_Details}     ${i}
    \   ${lctr}=     get from list  ${OR_New_Usr_Lctr_List}     ${i}
    \   input text   ${lctr}    ${value}

    input password  ${OR_Pswd_ip}   Test1234
    input password  ${OR_Cnfm_Pswd_ip}  Test1234
    ${username}=     get from list    ${New_User_Details}    8
    log to console  ${username}
    [return]    ${username}

# TO submit new user registration
kw_submit_User_Rgstr
    [Arguments]  ${username}

    click button    ${OR_Submit_Rgstrn}
    wait until page contains element  //*[@class="title"]   5s
    element should contain  //*[@class="title"]     Welcome ${username}
    element should contain  //*[@id="rightPanel"]/p     Your account was created successfully. You are now logged in.
    ${wlcome_msg}=  get text  //*[@id="rightPanel"]/p
    ${wlcome_statement}=  get text  //*[@class="title"]
    log to console  ${wlcome_msg}
    log to console  ${wlcome_statement}

#To recover lost login information
kw_Recover_forgotten_passwd
    [Arguments]     ${User_Info}

    click element   ${OR_Forgot_Passwd}
    page should contain element  ${OR_Fgot_Pswd_Title}  "Forgot password page opened"
    ${length}=    get length  ${OR_Fgot_Pswd_Lctr_List}
    :FOR  ${i}  IN RANGE    0  ${length}
    \   ${value}=     get from list  ${User_Info}    ${i}
    \   ${lctr}=     get from list  ${OR_Fgot_Pswd_Lctr_List}     ${i}
    \   input text   ${lctr}    ${value}
    CLICK BUTTON  ${OR_Find_login_Info_btn}

# Move to Homepage
kw_To_Home_Page
    click element  ${OR_hm_Button}
    wait until page contains element    ${OR_Hm_Identifier}  5s     error="Home Page not opened"
    log to console  "Home page opened"

#Verify avaliable features links to logged in user

kw_Verify_Available_Features_LoggedIn_User
    ${item}=    set variable  ''
    :FOR     ${item}    IN     @{OR_LoggedInUser_Links}
    \   page should contain element  ${item}
    \   log to console  ${item} is available

kw_Open_New_Account
    [Arguments]     ${acc_type}   ${Extng_Acc_Number}
    kw_To_Home_Page
    page should contain     Account Services
    click element  ${OR_Open_acc_link}
    page should contain element  ${OR_Open_Acc_Page_Title}  10s
    click element  ${OR_Acc_Type_Selection}
    select from list by value   ${OR_Acc_Type_Selection}    0
    set focus to element  ${OR_Existing_Acc_Select}
    click element  ${OR_Existing_Acc_Select}
    select from list by index  ${OR_Existing_Acc_Select}   1
    click button  ${OR_Submit_New_Acc}
    WAIT UNTIL PAGE CONTAINS ELEMENT  ${OR_Acc_Open_Title}
    page should contain  Congratulations, your account is now open.
    page should contain  Your new account number:
    ${acc_number}   get text  ${OR_New_Acc_Number}
    log to console  "new account number is: " ${acc_number}

kw_Accounts_Overview
    kw_To_Home_Page
    page should contain     Account Services
    click element  ${OR_Acc_Overview_link}
   #wait until page contains element  ${OR_Acc_overview_title}
    sleep   2s
    ${Acc_overview_pg_title}    get title
    page should contain element     ${OR_Acc_Table}
    set focus to element  ${OR_Acc_Table}
    @{Headers_Acc_Overview}

