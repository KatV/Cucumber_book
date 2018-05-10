Given("my account has been credited with {capture_cash_amount}") do |amount|
  my_account.credit(amount)
end

Then("the balance of my account should be {capture_cash_amount}") do |amount|
  # expect(my_account.balance).to eq(amount),
  # "Expected the balance to be #{amount} but it was #{my_account.balance}"
  # Because the eq expectation will raise an error if the balance isn’t the expected amount,
  # eventually will keep trying until the assertion passes or the timeout is reached.
  # We can implement this method by adding a new module of code to our support layer
  eventually { expect(my_account.balance).to eq(amount) }
end