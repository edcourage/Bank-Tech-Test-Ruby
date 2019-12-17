class Display

  def self.bank_statement(account_action_log_array)
    bank_statement_array = ["date || credit || debit || balance"]
    account_action_log_array.each do |action|
      if action[:type] == :deposit
        bank_statement_array << "#{action[:date]} || #{("%.2f" % action[:amount])} || || #{("%.2f" % action[:balance])}"
      elsif action[:type] == :withdrawal
        bank_statement_array << "#{action[:date]} || || #{("%.2f" % action[:amount])} || #{("%.2f" % action[:balance])}"
      end
    end
    puts bank_statement_array.join("\n")
  end

end
