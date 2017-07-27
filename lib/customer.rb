require 'account'

class Customer
    attr_reader :first, :last
    def initialize(name)
        @first, @last = name.split
        @accounts = []
    end
    
    def transfer(amount, from, to)
        src = self.find_account(from)
        dst = self.find_account(to)
        
        if amount > src.balance
            src.fee(50)
        else
            fee = [amount * 0.10, 25].min
            total = amount + fee
            src.withdraw(total)
            dst.deposit(amount)
        end
    end
    
    def num_accounts
        @accounts.size
    end
    
    def find_account(type)
        @accounts.find {|a| a.type == type}
    end
    
    def add_account(type)
        return if @accounts.any? {|a| a.type == type}
        a = Account.new(type)
        @accounts << a
    end
end
