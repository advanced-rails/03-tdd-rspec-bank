require 'account'

describe Account do
    describe '#initialize' do
        it 'should create a checking account with zero balance and no transactions' do
            a = Account.new(:checking)
            expect(a.type).to eql(:checking)
            expect(a.balance).to eql(0)
            expect(a.transactions.size).to eql(0)
        end
    end
end
