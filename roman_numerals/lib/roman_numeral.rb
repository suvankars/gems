class RomanNumeral
    attr_reader :numeral

    def initialize( numeral )
	@numeral = numeral
    end

    def valid?
	#Convert regx match result to boolean by adding '!!' before statement:
	!!(numeral =~ /^\d+$/) or !!(numeral =~ /^M{0,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$/)
    end
end
