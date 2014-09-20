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
	    inputs = [ "I", "V", "M", "D"]
	    inputs.each do | roman |
		numeral = RomanNumeral.new( roman )
		numeral.valid?.should == true
	    end	

	    invalid_inputs = [ "B", "A", "S", "U"]
	    invalid_inputs.each do | roman |
		numeral = RomanNumeral.new( roman )
		numeral.valid?.should == false
	    end
	end

	it "should check valid combination of roman numerals" do
	    numerals = [ "III", "IV", "VIII"]
	    numerals.each do | roman |
		numeral = RomanNumeral.new( roman )
		numeral.valid?.should == true
	    end
	end

	it "should check invalid roman numerals combination" do
	    numerals = [ "DD", "LL", "VVV", "DLLD"]
	    numerals.each do | roman |
		numeral = RomanNumeral.new( roman )
		numeral.valid?.should == false
	    end
	end

	it "should find wheather an input is valid decimal number" do
	    decimal_number = [ 1, 4, 8, 123]
	    decimal_number.each do | number |
		numeral = RomanNumeral.new( number.to_s )
		numeral.valid?.should == true
	    end	
	end
	
	    decimal_number = [ 1.12, -8]
	    decimal_number.each do | number |
	    	it "should find wheather an input number: #{number.to_s} is INVALID decimal number" do
				numeral = RomanNumeral.new( number.to_s )
				numeral.valid?.should == false
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

	describe ".to_roman" do
	base_digits.each do |decimal, roman|
	    it "should convert the decimal value #{decimal} to the roman numeral #{roman}" do
		numeral = RomanNumeral.new( decimal )
		numeral.to_roman.should == roman
	    end
	end
    end

	numerals = { 'MCMXLIV' => 1944,
		     'IX' => 9, 
		     'DLIX' => 559,
		     'XI' => 11,
		     'xvii' => 17
		   }

	numerals.each do |roman, decimal|
	    it "should convert the roman numeral #{roman} to the decimal value #{decimal}" do
		numeral = RomanNumeral.new( roman )
		numeral.to_decimal.should == decimal
	    end
	end

	numerals = ['VX', 'LL', 'IIII', 'VVLDD', 'IDD']
	numerals.each do |roman|
	    it "should NOT convert the roman numeral #{roman} to the decimal value " do
		numeral = RomanNumeral.new( roman )
		numeral.to_decimal.should == "Invalid roman numerals"
	    end
	end
    end
    
end
