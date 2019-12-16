require_relative 'account_tracker'
class Account
  attr_reader :current_balance

  def initialize(account_tracker = AccountTracker.new)
    @account_tracker = account_tracker
    @current_balance = 0
  end

  def deposit(amount)
    @current_balance += amount
    @account_tracker.deposits_tracker(amount, @current_balance)
  end

  def withdrew(amount)
    @current_balance -= amount
    @account_tracker.withdrawals_tracker(amount, @current_balance)
  end

end
