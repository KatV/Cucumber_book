# Pushing some of the details down into our World module means
# the step definition code is at a higher level of abstraction.
module KnowsTheUserInterface
  class UserInterface
    include Capybara::DSL

    def withdraw_from(account, amount)
      visit '/'
      fill_in 'Amount', :with => amount
      click_button 'Withdraw'
    end
  end

  def my_account
    # Using ||= ensures that the new Account will be created only once and then stored in an instance variable.
    @my_account ||= Account.new
  end

  def cash_slot
    @cash_slot ||= CashSlot.new
  end

  def teller
    @teller ||= UserInterface.new
  end
end


World(KnowsTheUserInterface)