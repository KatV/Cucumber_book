require_relative 'transaction_queue'
require_relative 'account'

class Teller
  def initialize(cash_slot)
    @cash_slot = cash_slot
  end

  def withdraw_from(account, amount)
    account.debit(amount)
    @cash_slot.dispense(amount)
  end
end

class CashSlot
  def contents
    @contents or raise("I'm empty")
  end

  def dispense(amount)
    @contents = amount
  end
end

# If you run this file with the command bundle exec ruby lib/nice_bank.rb ,
# you should see Sinatra start up a web server.
# You can now try hitting it from a browser at http://localhost:4567/ .
# That’s the beginning of our user interface.
require 'sinatra'

get '/' do
  %{
  <html>
    <body>
      <form action="/withdraw" method="post">
​     <label for="amount">Amount</label>
​     <input type="text" id="amount" name="amount">​
​     <button type="submit">Withdraw</button>
​     </form>
​   </body>
​ </html>
​ }
end

set :cash_slot, CashSlot.new
set :account do
  fail 'account has not been set'
end

post '/withdraw' do
  teller = Teller.new(settings.cash_slot)
  am = Money.new(params[:amount].to_i * 100, 'USD')
  teller.withdraw_from(settings.account, am)
end