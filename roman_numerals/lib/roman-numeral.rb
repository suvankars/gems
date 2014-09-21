class RomanNumeral
	attr_reader :numeral

	def initialize( numeral )
		@numeral = numeral
		#@value
	end

	def numerals_map
		{
			1    => 'I',
	    	4    => 'IV',
	    	5    => 'V',
	    	9    => 'IX',
		    10   => 'X',
		    40   => 'XL',
		    50   => 'L',
		    90   => 'XC',
		    100  => 'C',
		    400  => 'CD',
		    500  => 'D',
		    900  => 'CM',
		    1000 => 'M'
		}
	end

	def valid?
		#Will considered as valid input if input string contains number or roman numeral in correct order 
		if (numeral.to_s =~ /^\d+$/)
			true
		else
			!!(numeral.upcase =~ /^M{0,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$/) 
		end
	end

	def to_decimal
		if valid?
			decimal = convert_to 
		else
			"Invalid roman numerals"
		end
	end

	def to_roman
		if valid?
			roman = convert_from 
		else
			"Invalid decimal number"
		end
		
	end

	def convert_to
		value = 0
			roman_symbols = numeral.upcase
			numerals_map.values.reverse.each do |symbol|
				while roman_symbols.start_with? ( symbol )
					roman_symbols = roman_symbols.slice(symbol.length, roman_symbols.length)
					value += numerals_map.key( symbol )
				end
			end

		value
	end

	

	def convert_from
		value = ''
		decimal_number = numeral
		numerals_map.keys.reverse.each do |decimal|
			while decimal_number >= decimal
				decimal_number -= decimal
				value += numerals_map[decimal]
			end
		end
		value
	end
end
