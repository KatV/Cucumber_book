require_relative 'transaction_queue'
require_relative 'balance_store'

transaction_queue = TransactionQueue.new
balance_store = BalanceStore.new
puts 'transaction processor ready'

# The loop tries to read a message off the transaction queue.
# If it finds one, it pauses for a second, calculates the new balance, and then stores it on the BalanceStore .
loop do
  transaction_queue.read do |message|
    transaction_queue = message.to_i
    new_balance = balance_store.balance + transaction_amount
    balance_store.balance = new_balance
  end

end