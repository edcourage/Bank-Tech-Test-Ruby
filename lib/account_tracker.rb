class AccountTracker
  attr_reader :log

  def initialize
    @log = []
  end

  def withdrawals_tracker(amount, balance, date = Time.now.strftime("%d/%m/%Y"))
    @log << {
      type: :withdrawal,
      date: date,
      amount: amount,
      balance: balance
    }
  end
end
