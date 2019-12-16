require 'display'

describe Display do

  context '#bank_statement' do
    it 'bank statment is printed in readable format' do
      action_date = Time.now.strftime("%d/%m/%Y")
      logged_actions = [{
        type: :deposit,
        date: action_date,
        amount: 100,
        balance: 1000
      },
      {
        type: :withdrawal,
        date: action_date,
        amount: 100,
        balance: 900
      }]
      account_tracker = double 'account tracker'
      allow(account_tracker).to receive(:log_sorted_by_most_recent).and_return logged_actions

      expect { Display.bank_statement(account_tracker.log_sorted_by_most_recent) }.to output(
        "date || credit || debit || balance\n#{action_date} || 100.00 || || 1000.00\n#{action_date} || || 100.00 || 900.00\n").to_stdout
    end
  end

end
