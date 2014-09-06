$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'roman_numeral'

describe RomanNumeral do
    base_digits = {
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

    describe ".valid?" do
	it "should find wheather an input belongs to 7 valid roman numeral" do
	    roman_numerals = [ "III", "IV", "VIII", "XIIDI"]
	    roman_numerals.each do | roman |
		numeral = RomanNumeral.new( roman )
		numeral.valid?.should == true
	    end	
	end
	it "should find wheather an input is valid decimal number" do
	    decimal_number = [ 1, 4, 8, 123]
	    decimal_number.each do | number |
		numeral = RomanNumeral.new( number )
		numeral.valid?.should == true
	    end	
	end
    end

    describe ".to_roman" do
	base_digits.each do |decimal, roman|
	    it "should convert the decimal value #{decimal} to the roman numeral #{roman}" do
		numeral = RomanNumeral.new(decimal)
		numeral.to_roman.should == roman
	    end
	end
    end

    describe ".to_decimal" do
	base_digits.each do |decimal, roman|
	    it "should convert the roman numeral #{roman} to the decimal value #{decimal}" do
		numeral = RomanNumeral.new( roman )
		numeral.to_decimal.should == decimal
	    end
	end
    end
    
end
