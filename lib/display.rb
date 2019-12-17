class Display

  def self.bank_statement(account_action_log_array)
    bank_statement_array = [bank_statement_header]
    account_action_log_array.each do |action|
      bank_statement_array << account_action_display_config(action)
    end
    puts bank_statement_array.join("\n")
  end

  def self.account_action_display_config(action)
    if action[:type] == :deposit
      "#{action[:date]} || #{("%.2f" % action[:amount])} || || #{("%.2f" % action[:balance])}"
    elsif action[:type] == :withdrawal
      "#{action[:date]} || || #{("%.2f" % action[:amount])} || #{("%.2f" % action[:balance])}"
    end
  end

  def self.bank_statement_header
    "date || credit || debit || balance"
  end

  private_class_method :account_action_display_config, :bank_statement_header

end
