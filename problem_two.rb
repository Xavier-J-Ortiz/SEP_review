# Integers: Recreation One
# had to use this rationale found here https://www.math.upenn.edu/~deturck/m170/wk3/lecture/sumdiv.html
# and here https://www.math.upenn.edu/~deturck/m170/wk3/lecture/sumdiv.html
require 'prime'

def list_squared(m, n)
	answer = [] 
	(m..n).each do |location|
		sum_of_squares = 1
		get_prime_factors(location).each do |key, value|
			sum_of_exponent_series = 0
			(0..value).each do |exponent|
				sum_of_exponent_series += (key ** exponent) ** 2
			end
			sum_of_squares *= sum_of_exponent_series
		end
		answer.push([location, sum_of_squares]) if (sum_of_squares ** 0.5) % 1 == 0
	end
	answer
end

def get_prime_factors(location)
	highest_prime_factor = (location ** 0.5) / 2
	primes = Prime.take_while { |i| i <= highest_prime_factor }
	check_for_prime_factors(primes, location)
end

def check_for_prime_factors(primes, location)
	i = 0
	prime_factors = {}
	while i < primes.length
		if location % primes[i] == 0
			prime_factors[primes[i]] = prime_factors[primes[i]] ? prime_factors[primes[i]] + 1 : 1
			location /= primes[i]
		else
			i += 1
		end
	end
	prime_factors[location] = 1 unless location == 1
	prime_factors
end

puts list_squared(1, 250).to_s
