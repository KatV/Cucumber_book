# Before do |scenario|
#   puts "Starting scenario #{scenario.name}"
# end

# Around do |scenario, block|
#   puts "About to run #{scenario.name }"
#   block.call
#   puts "Finished running #{ scenario.name }"
# end

# If you want to run code after all of your features have finished, you can use Ruby’s built-in at_exit
#  hook, which will be run just before the Cucumber process exits.

Before do
  BalanceStore.new.balance = 0
  TransactionQueue.clear
end