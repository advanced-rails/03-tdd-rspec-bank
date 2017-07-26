class Account
    attr_reader :type, :balance, :transactions
    def initialize(type)
        @type = type
        @balance = 0
        @transactions = []
    end
end
