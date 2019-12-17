require 'account'

describe Account do
  let(:account_tracker) { double 'account_tracker' }
  let(:account) { Account.new(account_tracker) }

  before(:each) do
    allow(account_tracker).to receive(:deposits_tracker)
    allow(account_tracker).to receive(:withdrawals_tracker)
    allow(account_tracker).to receive(:log_sorted_by_most_recent)
  end

  context '#deposit' do
    it 'money is added to account' do
      account.deposit(1000)
      expect(account.current_balance).to eq 1000
    end

    it 'deposits are tracked' do
      expect(account_tracker).to receive(:deposits_tracker).with(1000, 1000)
      account.deposit(1000)
    end

  end

  context '#withdrew' do
    before(:each) do
      account.deposit(1000)
    end
    it 'money is subtracted from account' do
      account.withdrew(500)
      expect(account.current_balance).to eq 500
    end

    it 'withdrawals are tracked' do
      expect(account_tracker).to receive(:withdrawals_tracker).with(500, 500)
      account.withdrew(500)
    end
  end

  context '#view_bank_statement' do
    it 'runs the is call method on display class' do
      display = double 'display'
      expect(display).to receive(:bank_statement).with(account_tracker.log_sorted_by_most_recent)
      account.view_bank_statement(display)
    end
  end

end
