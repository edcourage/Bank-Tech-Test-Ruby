require 'account_tracker'

describe AccountTracker do

  let(:account_tracker) { AccountTracker.new }

  context '#withdrawals_tracker' do
    it 'action is added to action log' do
      current_balance_after_withdrawal = 1000
      withdrawal_amount = 500
      account_tracker.withdrawals_tracker(withdrawal_amount, current_balance_after_withdrawal)
      expect(account_tracker.log.count).to eq 1
    end

    it 'the action type, date of action, amount, and balance afer action are logged' do
      current_balance_after_withdrawal = 1000
      withdrawal_amount = 500
      action_date = Time.now.strftime("%d/%m/%Y")
      expected_logged_action = {
        type: :withdrawal,
        date: action_date,
        amount: withdrawal_amount,
        balance: current_balance_after_withdrawal
      }
      account_tracker.withdrawals_tracker(withdrawal_amount, current_balance_after_withdrawal)
      expect(account_tracker.log.first).to eq expected_logged_action
    end
  end

  context '#deposits_tracker' do
    it 'action is added to action log' do
      current_balance_after_deposit = 1500
      deposit_amount = 500
      account_tracker.deposits_tracker(deposit_amount, current_balance_after_deposit)
      expect(account_tracker.log.count).to eq 1
    end

    it 'the action type, date of action, amount, and balance afer action are logged' do
      current_balance_after_deposit = 1500
      deposit_amount = 500
      action_date = Time.now.strftime("%d/%m/%Y")
      expected_logged_action = {
        type: :deposit,
        date: action_date,
        amount: deposit_amount,
        balance: current_balance_after_deposit
      }
      account_tracker.deposits_tracker(deposit_amount, current_balance_after_deposit)
      expect(account_tracker.log.first).to eq expected_logged_action
    end
  end

end
