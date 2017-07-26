require 'account'

class Customer
    attr_reader :first, :last
    def initialize(name)
        @first, @last = name.split
        @accounts = []
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
