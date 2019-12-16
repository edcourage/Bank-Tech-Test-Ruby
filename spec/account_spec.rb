require 'account'

describe Account do

  let (:account) { Account.new }

  context '#deposit' do
    it 'money is added to account' do
      expect { account.deposit(1000) }.to change { account.current_balance }.by(1000)
    end
  end


end
