*** Variables ***

${WEB_URL}                                  http://localhost:3000
${WEB_BROWSER}                              chrome

${CU_bank_login_form}                       CU bank login form
${test_data_account_number}                 1234567890
${test_data_password}                       1234
${test_data_deposit_1}                      1
${test_data_deposit_2}                      2
${test_data_deposit_10}                     10
${test_data_withdraw_not_int}               19.98
${balance}                                  0
${test_data_transfer_target_account_id}     4567890123
${test_data_transfer_1}                     1
${test_data_transfer_2}                     2
${test_data_transfer_24}                    24
${test_data_transfer_25}                    25
${test_data_error_message}                  your balance isn't not enough

${ACCOUNT_NUMBER}                           1234567890
${PASSWORD}                                 1234

${ACCOUNT_NUMBER_S3}                        7000000000
${PASSWORD_S3}                              1234

${login_header}                             Login
${test_account_no}                          6000000000
${test_account_wrong}                       600000000X
${test_account_wrong_minneg}                600000000
${test_account_wrong_maxplus}               60000000009
${test_account_password}                    1234
${account_header}                           Account ID:
${test_deposit_min}                         1
${test_deposit_minplus}                     2
${test_deposit_norm}                        10
${test_withdraw_min}                        1
${test_withdraw_minplus}                    2
${test_withdraw_norm}                       25
${test_withdraw_maxneg}                     49
${test_withdraw_max}                        50
${test_data_error_message}                  Please put accountId only number
${test_data_error_message_minneg}           Please fill accountId    10 digits
${test_data_error_message_maxplus}          Please fill accountId    10 digits
${test_non_numerical_transfer_acc}          123456789X
${non_numerical_transfer_acc_errmsg}        Please put accountId only number
${test_transfer_amount}                     1
${test_wrong_digit_transfer_acc}            123456789
${test_wrong_digit_maxplus_transfer_acc}    12345678901
${wrong_digit_transfer_acc_errmsg}          Please fill accountId    10 digits
${test_not_found_transfer_acc}              6789012345
${test_same_transfer_acc}                   ${test_account_no}
${not_found_transfer_acc_errmsg}            Not found your target account Id
${same_transfer_acc_errmsg}                 Cannot transfer to your own id
${test_transfer_acc}                        6000000001
${test_invalid_transfer_amount}             19.89
${test_invalid_transfer_amount_errmsg}      Please enter a valid value. The two nearest valid values are 19 and 20.
${test_non_number_transfer_amount}          0
${test_insufficient_transfer_amount}        1000000
${non_number_transfer_errmsg}               Please put only number
${insufficient_transfer_errmsg}             your balance isn't not enough

