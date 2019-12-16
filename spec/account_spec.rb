require 'account'

describe Account do

  let(:account) { Account.new }

  context '#deposit' do
    it 'money is added to account' do
      account.deposit(1000)
      expect(account.current_balance).to eq 1000
    end
  end

  context '#withdrew' do
    it 'money is subtracted from account' do
      account.deposit(1000)
      account.withdrew(500)
      expect(account.current_balance).to eq 500
    end
  end

end
