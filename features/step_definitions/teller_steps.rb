When("I withdraw {capture_cash_amount}") do |amount|
  teller.withdraw_from(my_account, amount)
end