def expanded_form(num)
	split_num = num.to_s.split("")
	exponent = 0
	answer = []
	split_num.reverse.each do |dec|
		dec = dec.to_i
		unless dec == 0
			partial_answer = dec * (10 ** exponent)
			answer.unshift(partial_answer.to_s)
		end
		exponent += 1
	end
	answer.join(" + ")
end
