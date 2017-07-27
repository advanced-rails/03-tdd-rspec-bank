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

    describe '#transfer' do
        it 'should transfer from checking to savings when funds exist' do
            sara = Customer.new('sara jones')
            sara.add_account(:checking)
            sara.add_account(:savings)
            checking = sara.find_account(:checking)
            savings = sara.find_account(:savings)
            checking.deposit(300)
            sara.transfer(70, :checking, :savings)
            expect(checking.balance).to eql(223.0)
            expect(savings.balance).to eql(70)
        end

        it 'should not transfer and charge $50 fee from checking when funds do not exist' do
            sara = Customer.new('sara jones')
            sara.add_account(:checking)
            sara.add_account(:savings)
            checking = sara.find_account(:checking)
            savings = sara.find_account(:savings)
            checking.deposit(3)
            sara.transfer(70, :checking, :savings)
            expect(checking.balance).to eql(-47)
            expect(savings.balance).to eql(0)
        end
    end
end
