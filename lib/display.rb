class Display
  def self.bank_statement(account_action_log_array)
    puts "date || credit || debit || balance"
    account_action_log_array.each do |action|
    if action[:type] == :deposit
      puts "#{action[:date]} || #{("%.2f" % action[:amount])} || || #{("%.2f" % action[:balance])}"
    elsif action[:type] == :withdrawal
      puts "#{action[:date]} || || #{("%.2f" % action[:amount])} || #{("%.2f" % action[:balance])}"
    end
  end
  end
end
