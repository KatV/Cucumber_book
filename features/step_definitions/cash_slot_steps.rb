Then("{capture_cash_amount} should be dispensed") do |amount|
  expect(cash_slot.contents).to eq(amount)
end