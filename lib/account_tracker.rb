class AccountTracker

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

  def deposits_tracker(amount, balance, date = Time.now.strftime("%d/%m/%Y"))
    @log << {
      type: :deposit,
      date: date,
      amount: amount,
      balance: balance
    }
  end

  def log_sorted_by_most_recent
    @log.reverse
  end

end
