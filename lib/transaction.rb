class Transaction
    attr_reader :type, :amount, :date
    def initialize(type, amount)
        @type = type
        @amount = amount.to_f
        @date = Time.now
    end
end
