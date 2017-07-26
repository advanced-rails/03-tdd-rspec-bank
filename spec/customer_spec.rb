require 'customer'

describe Customer do
    describe '#initialize' do
        it 'should create a customer with no accounts' do
            c = Customer.new('sara jones')
            expect(c.first).to eql('sara')
            expect(c.last).to eql('jones')
            expect(c.num_accounts).to eql(0)
        end
    end

    describe '#add_account' do
        it 'should create a add checking account to customer' do
            c = Customer.new('sara jones')
            c.add_account(:checking)
            expect(c.num_accounts).to eql(1)
        end

        it 'should not create dupliate checking accounts on customer' do
            c = Customer.new('sara jones')
            c.add_account(:checking)
            c.add_account(:checking)
            expect(c.num_accounts).to eql(1)
        end
    end

    describe '#find_account' do
        it 'should find an account' do
            c = Customer.new('sara jones')
            c.add_account(:checking)
            c.add_account(:savings)
            a = c.find_account(:savings)
            expect(a.type).to eql(:savings)
        end
    end
end
