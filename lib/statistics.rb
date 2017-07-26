class Statistics
    def self.mean(numbers)
        numbers.sum / numbers.size.to_f
    end

    def self.median(numbers)
        n = numbers.size
        if n.odd?
            idx = (n/2).floor
            numbers[idx]
        else
            idx = (n / 2) - 1
            values = numbers[idx, 2]
            values.sum / 2.0
        end
    end
    
    def self.stdev(numbers)
        n = numbers.size
        mean = numbers.sum / n.to_f
        sum_sq_diff = numbers.map {|x| (x - mean) ** 2}.sum
        (sum_sq_diff / (n - 1)) ** 0.5
    end
end
