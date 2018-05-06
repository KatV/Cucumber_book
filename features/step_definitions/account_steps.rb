Given("my account has been credited with {capture_cash_amount}") do |amount|
  my_account.credit(amount)
end

Then("the balance of my account should be {capture_cash_amount}") do |amount|
  expect(my_account.balance).to eq(amount),
  "Expected the balance to be #{amount} but it was #{my_account.balance}"
end