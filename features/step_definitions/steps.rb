# module MyCustomHelperModule
#   def my_helper_method
#
#   end
# end
#
# World(MyCustomHelperModule)
#
# class MySpecialWorld
#   def some_helper_method
#
#   end
# end
#
# World { MySpecialWorld.new}







Then("{capture_cash_amount} should be dispensed") do |amount|
  expect(cash_slot.contents).to eq(amount)
end

