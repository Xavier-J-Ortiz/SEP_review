# Integers: Recreation One
# had to use this rationale found here https://www.math.upenn.edu/~deturck/m170/wk3/lecture/sumdiv.html
# and here https://www.math.upenn.edu/~deturck/m170/wk3/lecture/sumdiv.html

require 'prime'

def list_squared(m, n)
	answer = [] 
	(m..n).each do |location|
		prime_factor = get_prime_factors(location)
		sum_of_squares = 1
		prime_factor.each do |key, value|
			sum_of_prime_factor = 0
			(0..value).each do |exponent|
				sum_of_prime_factor += (key ** exponent) ** 2
			end
			sum_of_squares *= sum_of_prime_factor
		end
		answer.push([location, sum_of_squares]) if (sum_of_squares ** 0.5) % 1 == 0
	end
	answer
end

def get_prime_factors(location)
	highest_prime_factor = (location ** 0.5) /2
	list_of_primes = Prime.take_while { |i| i <= highest_prime_factor }
	i = 0
	number = location
	prime_factors = {}
	while i < list_of_primes.length
		if number % list_of_primes[i] == 0
			if prime_factors[list_of_primes[i]]
				prime_factors[list_of_primes[i]] += 1
			else
				prime_factors[list_of_primes[i]] = 1
			end
			number /= list_of_primes[i]
		else
			i += 1
		end
	end
	prime_factors[number] = 1 unless number == 1
	prime_factors
end
