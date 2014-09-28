#  roman-numeral

Convert roman numeral to decimal number or viceversa. 

## Installation

To use the roman numerals gem, you need to add this line to your Gemfile

```
gem 'roman-numeral'
```
And then execute:

```
$ bundle
```
Or install it yourself as:

```
$ gem install roman-numeral
```

##Usage
In *irb* console:

Convert roman numeral to decimal number
```
>> require 'roman-numeral'

>> r = RomanNumeral.new("IV")
>> r.to_decimal
=> 4
```
Convert decimal number to roman numeral
```
>> d = RomanNumeral.new(17)
>> d.to_roman
=> "XVII"
```

###Basic working principles of roman-rumeral 
In order to convert roman numeral to decimal nuber, it works like a **State Machine**.
 


