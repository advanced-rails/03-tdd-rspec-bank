require 'transaction'
require 'statistics'

class Account
    attr_reader :type, :balance, :transactions
    def initialize(type)
        @type = type
        @balance = 0
        @transactions = []
    end
    
    def deposit(amount)
        @balance += amount
        t = Transaction.new(:deposit, amount)
        @transactions << t
    end

    def withdraw(amount)
        if amount <= @balance
            @balance -= amount
            t = Transaction.new(:withdraw, amount)
        else
            @balance -= 50
            t = Transaction.new(:fee, 50)
        end

        @transactions << t
    end
    
    def filter_transactions(type = nil)
        type ? @transactions.select {|t| t.type == type} : @transactions
    end

    def stats(type)
        transactions = self.filter_transactions(type)
        numbers = transactions.map {|t| t.amount}
        mean = Statistics.mean(numbers)
        median = Statistics.median(numbers)
        stdev = Statistics.stdev(numbers)
        {mean: mean, median: median, stdev: stdev}
    end
end
