*** Variables ***
${OR_Register}          //*[text()='Register' and @href]
${OR_Parabank_Logo}     //*[@class="logo"][@title="ParaBank"]

#Login Page
${OR_Custm_Login_Label}     //*[@id="leftPanel"]/h2[text()= "Customer Login"]
${OR_Username}      //*[@type="text"][@name="username"]
${OR_Password}      //*[@type="password"][@name="password"]
${OR_LogIn_Btn}     //*[@type="submit"][@value="Log In"]

# Register New User page
${OR_Register_Pg_Title}    //*[@class='title'][text()="Signing up is easy!"]
${OR_hm_Button}        //*[@class="button"]/li[@class="home"]/a[text()="home"]
${OR_Hm_Identifier}     //*[@id="rightPanel"]/*[text()='Latest News']
${OR_FirstName_ip}      //*[text()='First Name:']/following::td/input
${OR_LastName_ip}       //*[text()='Last Name:']/following::td/input
${OR_Address_ip}       //*[text()='Address:']/following::td/input
${OR_City_ip}       //*[text()='City:']/following::td/input
${OR_State_ip}       //*[text()='State:']/following::td/input
${OR_Zip_ip}       //*[text()='Zip Code:']/following::td/input
${OR_Phone_ip}       //*[text()='Phone #:']/following::td/input
${OR_SSN_ip}       //*[text()='SSN:']/following::td/input
${OR_UserName_ip}       //*[text()='Username:']/following::td/input

${OR_Pswd_ip}       //*[text()='Password:']/following::td/input
${OR_Cnfm_Pswd_ip}       //*[text()='Confirm:']/following::td/input
${OR_Submit_Rgstrn}     //*[text()='Confirm:']/following::tr/td/input[@class='button']
#@{OR_New_Usr_Lctr_List}     ['${OR_FirstName_ip}', '${OR_LastName_ip}', '${OR_Address_ip}', '${OR_City_ip}', '${OR_State_ip}','${OR_Zip_ip}', '${OR_Phone_ip}', '${OR_SSN_ip}']
@{OR_New_Usr_Lctr_List}     ${OR_FirstName_ip}  ${OR_LastName_ip}   ${OR_Address_ip}    ${OR_City_ip}   ${OR_State_ip}  ${OR_Zip_ip}    ${OR_Phone_ip}  ${OR_SSN_ip}    ${OR_UserName_ip}

# Forgot Password Page
${OR_Forgot_Passwd}      //*[text()='Forgot login info?'][@href]
${OR_Fgot_Pswd_Title}   //*[text()='Customer Lookup'][@class='title']

@{OR_Fgot_Pswd_Lctr_List}     ${OR_FirstName_ip}  ${OR_LastName_ip}   ${OR_Address_ip}    ${OR_City_ip}   ${OR_State_ip}  ${OR_Zip_ip}   ${OR_SSN_ip}
${OR_Find_login_Info_btn}  //*[@type="submit"][@value="Find My Login Info"]



#Logged in user HomePage
${OR_Open_acc_link}    //*[text()="Open New Account"][@href]
${OR_Acc_Overview_link}    //*[text()="Accounts Overview"][@href]
${OR_Transfer_Funds_link}  //*[text()="Transfer Funds"][@href]
${OR_Bill_pay_link}    //*[text()="Bill Pay"][@href]
${OR_FindTxn_link}     //*[text()="Find Transactions"][@href]
${OR_Update_Cntct_link}     //*[text()="Update Contact Info"][@href]
${OR_Req_Loan_link}     //*[text()="Request Loan"][@href]
${OR_Log_Out_link}     //*[text()="Log Out"][@href]

@{OR_LoggedInUser_Links}       ${OR_Open_acc_link}    ${OR_Acc_Overview_link}    ${OR_Transfer_Funds_link}  ${OR_Bill_pay_link}    ${OR_FindTxn_link}     ${OR_Update_Cntct_link}    ${OR_Req_Loan_link}    ${OR_Log_Out_link}

#Open Account Page
${OR_Open_Acc_Page_Title}      //*[@class='title'][text()= "Open New Account"]
${OR_Acc_Type_Selection}        //*[text()= "What type of Account would you like to open?"]/following::select[@id="type"]
${OR_Existing_Acc_Select}       //*[@type="submit"][@value="Open New Account"]//preceding::select[1]
${OR_Submit_New_Acc}        //*[@type="submit"][@value="Open New Account"]
${OR_New_Acc_Number}        //*[text()="Your new account number:"]/following::a[@id="newAccountId"]
${OR_Acc_Open_Title}       //*[@class="title"][text()="Account Opened!"]

#Account Overview Page
${OR_Acc_overview_title}    //*[@class="title"][text()="Accounts Overview"]
${OR_Acc_Table}             //*[@id="accountTable"]
