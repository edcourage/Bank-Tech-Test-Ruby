require_relative 'account_tracker'
require_relative 'display'

class Account
  attr_reader :current_balance

  def initialize(account_tracker = AccountTracker.new)
    @account_tracker = account_tracker
    @current_balance = 0
  end

  def deposit(amount)
    @account_tracker.deposits_tracker(amount, @current_balance += amount)
  end

  def withdrew(amount)
    @account_tracker.withdrawals_tracker(amount, @current_balance -= amount)
  end

  def view_bank_statment(display = Display)
    display.bank_statement(@account_tracker.log_sorted_by_most_recent)
  end

end
