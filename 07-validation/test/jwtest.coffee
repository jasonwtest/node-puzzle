assert   = require 'assert'
  {validate = require '../lib'


describe '07-validation'->

#scenario group 1: test requirement - target: id required, integer, positive

#TS1.1 - id required: value missing, should fail
it 'should return 'false' for missing data: id'->
  assert !validate
    id: 
    name: 'JW Test'
    email: 'jasonw@a.com'
    taxRate: 0.1
    favouriteColour: '#323232'
    interest: ['cycling', 'programming']


#TS1.2 - integer: float value, should fail
it 'should return 'false' for invalid data format:id'->
  assert !validate
    id: 0.1
    name: 'JW Test'
    email: 'jasonw@a.com'
    taxRate: 0.1
    favouriteColour: '#323232'
    interest: ['cycling', 'programming']


#TS1.3 - positive: but 0 0 is NOT positive (or negative). should fail
it 'should return 'false' for invalid id=0 :id'->
  assert !validate
    id: 0
    name: 'JW Test'
    email: 'jasonw@a.com'
    taxRate: 0.1
    favouriteColour: '#323232'
    interest: ['cycling', 'programming']


#TS1.4 - positive: negative value, should fail
it 'should return 'false' for invalid id<0 :id'->
  assert !validate
    id: -1
    name: 'JW Test'
    email: 'jasonw@a.com'
    taxRate: 0.1
    favouriteColour: '#323232'
    interest: ['cycling', 'programming']


#TS1.5 - meet all requirement: required, integer, positive, max integer (suppose 8 digi#TS) should pass
it 'should return 'true' for valid id :id'->
  assert !validate
    id: 255,
    name: 'JW Test'
    email: 'jasonw@a.com'
    taxRate: 0.1
    favouriteColour: '#323232'
    interest: ['cycling', 'programming']

#TS1.6 - positive: to be tested and talk to developer. id=01=1
it 'should return 'true' for valid id :id'->
  assert !validate
    id: 01
    name: 'JW Test'
    email: 'jasonw@a.com'
    taxRate: 0.1
    favouriteColour: '#323232'
    interest: ['cycling', 'programming']



#scenario group 2: test requirement - target: name required, string, 63 character max length

#TS2.1 - name requried: value missing, should fail
it 'should return 'false' for missing value: name'->
  assert !validate
    id: 1
    name: 
    email: 'jasonw@a.com'
    taxRate: 0.1
    favouriteColour: '#323232'
    interest: ['cycling', 'programming']


#TS2.2 - string: integer, should fail
it 'should return 'false' for invalid value - not a string: name'->
  assert !validate
    id: 1
    name: 100
    email: 'jasonw@a.com'
    taxRate: 0.1
    favouriteColour: '#323232'
    interest: ['cycling', 'programming']


#TS2.3 - string: max len(string)=63. len=0 should fail
it 'should return 'false' for invalid value - empty string: name'->
  assert !validate
    id: 1
    name: ''
    email: 'jasonw@a.com'
    taxRate: 0.1
    favouriteColour: '#323232'
    interest: ['cycling', 'programming']

#TS2.4 - string: string - len(string)=63, len=64, should fail
it 'should return 'false' for len>63: name'->
  assert !validate
    id: 1
    name: '1234567890123456789012345678901234567890123456789012345678901234'
    email: 'jasonw@a.com'
    taxRate: 0.1
    favouriteColour: '#323232'
    interest: ['cycling', 'programming']

#TS2.5 - string: string - len=1 should Pass
it 'should return 'true' for len=1=min_len: name'->
  assert !validate
    id: 1
    name: '1'
    email: 'jasonw@a.com'
    taxRate: 0.1
    favouriteColour: '#323232'
    interest: ['cycling', 'programming']

#TS2.6 - string: string - len=63, should Pass
it 'should return 'true' for len=63=max_len: name'->
  assert !validate
    id: 1
    name: '123456789012345678901234567890123456789012345678901234567890123'
    email: 'jasonw@a.com'
    taxRate: 0.1
    favouriteColour: '#323232'
    interest: ['cycling', 'programming']


#TS2.7 - string: invalid string
it 'should return 'false' for invalid string: name'->
  assert !validate
    id: 1
    name: myname,
    email: 'jasonw@a.com'
    taxRate: 0.1
    favouriteColour: '#323232'
    interest: ['cycling', 'programming']



#scenario group 3: test requirement - target: email required, string, 255 character max length
#TS3.1 - email required: value missing, should fail
it 'should return 'false' for missing   email: email'->
  assert !validate
    id: 1
    name: 'JW Test'
    email: 
    taxRate: 0.1
    favouriteColour: '#323232'
    interest: ['cycling', 'programming']

#TS3.2 - string: number, should fail
it 'should return 'false' for invalid value : email'->
  assert !validate
    id: 1
    name: 'JW Test'
    email: 1
    taxRate: 0.1
    favouriteColour: '#323232'
    interest: ['cycling', 'programming']

#TS3.3 - 255 char max length: 256 char long, should fail
it 'should return 'false' for invalid value : email'->
  assert !validate
    id: 1
    name: 'JW Test'
    email:  
'12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123 
456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567 
890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901 
2345678901234567890123456789012345678901234567890123456789012345678901234567890@a.com'
    taxRate: 0.1
    favouriteColour: '#323232'
    interest: ['cycling', 'programming']

#TS3.4 - 255 char max length: 0 char long, should fail
it 'should return 'false' for invalid value : email'->
  assert !validate
    id: 1
    name: 'JW Test'
    email: ''
    taxRate: 0.1
    favouriteColour: '#323232'
    interest: ['cycling', 'programming']


#TS3.5 - 255 char max length: 1 char long, should pass as per spec. (but logically, should fail, see the laste test case of this section. email address should match certain  
pattern)
it 'should return 'false' for invalid value - surely not an email address : email'->
  assert !validate
    id: 1
    name: 'JW Test'
    email: 'A'
    taxRate: 0.1
    favouriteColour: '#323232'
    interest: ['cycling', 'programming']


#TS3.6 - 255 char max length: 255 char long, should pass 
it 'should return 'true' for valid value: email'->
  assert !validate
    id: 1
    name: 'JW Test'
    email:  
'12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123 
456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567 
890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901 
234567890123456789012345678901234567890123456789012345678901234567890123456789@a.com'
    taxRate: 0.1
    favouriteColour: '#323232'
    interest: ['cycling', 'programming']


#TS3.7 - should be a valid address, but not a string, should fail
it 'should return 'false' for invalid string: email'->
  assert !validate
    id: 1
    name: 'JW Test'
    email: jasonw@a.com,
    taxRate: 0.1
    favouriteColour: '#323232'
    interest: ['cycling', 'programming']



#TS3.8 - Extra test case (Business to confirm): the email address match the patern - string1@string2.string3 
#please confirm if any pre-defined valid pattern for email address. Test cases will be finalised accordingly


#scenario group 4: test requirement - target: taxRate required, float, minimum 0 and maximum 1
#TS4.1 - required: missing, should fail 
it 'should return 'false' for missing value: taxRate'->
  assert !validate
    id: 1
    name: 'JW Test'
    email: 'jasonw@a.com'
    taxRate: 
    favouriteColour: '#323232'
    interest: ['cycling', 'programming']


#TS4.2 - float: integer, should fail 
it 'should return `false` for invalid data: taxRate'->
  assert !validate
    id: 1
    name: 'JW Test'
    email: 'jasonw@a.com'
    taxRate: 1
    favouriteColour: '#323232'
    interest: ['cycling', 'programming']

#TS4.3 - minimum 0: negative float, should fail 
it 'should return `false` for invalid data: taxRate'->
  assert !validate
    id: 1
    name: 'JW Test'
    email: 'jasonw@a.com'
    taxRate: -0.1
    favouriteColour: '#323232'
    interest: ['cycling', 'programming']

#TS4.4 - maximum 1: postive float, more than 1 should fail 
it 'should return `false` for invalid data: taxRate'->
  assert !validate
    id: 1
    name: 'JW Test'
    email: 'jasonw@a.com'
    taxRate: 1.001
    favouriteColour: '#323232'
    interest: ['cycling', 'programming']

#TS4.5 - float, minimum 0 should pass
it 'should return `true` for valid data: taxRate'->
  assert !validate
    id: 1
    name: 'JW Test'
    email: 'jasonw@a.com'
    taxRate: 0.0
    favouriteColour: '#323232'
    interest: ['cycling', 'programming']

#TS4.6 - integer, minimum 0 should fail
it 'should return `fail` for invalid data: taxRate'->
  assert !validate
    id: 1
    name: 'JW Test'
    email: 'jasonw@a.com'
    taxRate: 0
    favouriteColour: '#323232'
    interest: ['cycling', 'programming']


#TS4.7 - float, max 1 should pass
it 'should return `pass` for valid data: taxRate'->
  assert !validate
    id: 1
    name: 'JW Test'
    email: 'jasonw@a.com'
    taxRate: 1.0
    favouriteColour: '#323232'
    interest: ['cycling', 'programming']

#TS4.8 - float, extra 0 should pass
it 'should return `pass` for valid data: taxRate'->
  assert !validate
    id: 1
    name: 'JW Test'
    email: 'jasonw@a.com'
    taxRate: 0.10
    favouriteColour: '#323232'
    interest: ['cycling', 'programming']

#TS4.9 - percentage, should fail
it 'should return `false` for invalid data: taxRate'->
  assert !validate
    id: 1
    name: 'JW Test'
    email: 'jasonw@a.com'
    taxRate: 10%
    favouriteColour: '#323232'
    interest: ['cycling', 'programming']


#scenario group 5: test requirement - target:favouriteColour optional, string, colour hex
#TS5.1 - optional: missing, should pass
it 'should return `true` for valid data: favouriteColour'->
  assert !validate
    id: 1
    name: 'JW Test'
    email: 'jasonw@a.com'
    taxRate: 0.1
    favouriteColour: 
    interest: ['cycling', 'programming']

#TS5.2 - string: number should fail
it 'should return `false` for invalid data: favouriteColour'->
  assert !validate
    id: 1
    name: 'JW Test'
    email: 'jasonw@a.com'
    taxRate: 0.1
    favouriteColour: 1
    interest: ['cycling', 'programming']

#TS5.3 - string: string, but len of the string is 0 should fail - it must be a colour hex
it 'should return `false` for invalid data: favouriteColour'->
  assert !validate
    id: 1
    name: 'JW Test'
    email: 'jasonw@a.com'
    taxRate: 0.1
    favouriteColour: ''
    interest: ['cycling', 'programming']

#TS5.4 - string & color Hex: string, but not a hex, should fail
it 'should return `false` for invalid data: favouriteColour'->
  assert !validate
    id: 1
    name: 'JW Test'
    email: 'jasonw@a.com'
    taxRate: 0.1
    favouriteColour: '12345'
    interest: ['cycling', 'programming']

#TS5.5 - string & color Hex: string, but not a hex, should fail
it 'should return `false` for invalid data: favouriteColour'->
  assert !validate
    id: 1
    name: 'JW Test'
    email: 'jasonw@a.com'
    taxRate: 0.1
    favouriteColour: '12345'
    interest: ['cycling', 'programming']

#TS5.6 - string & color Hex: min value, should pass
it 'should return `true` for valid data: favouriteColour'->
  assert !validate
    id: 1
    name: 'JW Test'
    email: 'jasonw@a.com'
    taxRate: 0.1
    favouriteColour: '#0'
    interest: ['cycling', 'programming']

#TS5.7 - string & color Hex: invalid value, should fail
it 'should return `false` for invalid data: favouriteColour'->
  assert !validate
    id: 1
    name: 'JW Test'
    email: 'jasonw@a.com'
    taxRate: 0.1
    favouriteColour: '#-1'
    interest: ['cycling', 'programming']

#TS5.8 - string & color Hex: max value+1 should fail (suppose the max number is #FFFFFFFF)
it 'should return `false` for invalid data: favouriteColour'->
  assert !validate
    id: 1
    name: 'JW Test'
    email: 'jasonw@a.com'
    taxRate: 0.1
    favouriteColour: '#100000000'
    interest: ['cycling', 'programming']

#TS5.9 - string & color Hex: max value, should pass (suppose the max number is #FFFFFFFF)
it 'should return `true` for valid data: favouriteColour'->
  assert !validate
    id: 1
    name: 'JW Test'
    email: 'jasonw@a.com'
    taxRate: 0.1
    favouriteColour: '#FFFFFFFF'
    interest: ['cycling', 'programming']

#TS5.10 - string & color Hex: valid, should pass (suppose the max number is #FFFFFFFF)
it 'should return `true` for valid data: favouriteColour'->
  assert !validate
    id: 1
    name: 'JW Test'
    email: 'jasonw@a.com'
    taxRate: 0.1
    favouriteColour: '#ABCDEF'
    interest: ['cycling', 'programming']

#TS5.11 - string & color Hex: invalid, should fail (suppose the max number is #FFFFFFFF)
it 'should return `false` for invalid data: favouriteColour'->
  assert !validate
    id: 1
    name: 'JW Test'
    email: 'jasonw@a.com'
    taxRate: 0.1
    favouriteColour: '#G'
    interest: ['cycling', 'programming']


#scenario group 6: test requirement - target: interest optional, array, all interest must be strings (31 char max length) and no more than 4 interests should be provided
#TS6.1 optional: no interest, should pass
it 'should return `true` for valid data: interest'->
  assert !validate
    id: 1
    name: 'JW Test'
    email: 'jasonw@a.com'
    taxRate: 0.1
    favouriteColour: '#323232'
    interest: 

#TS6.2 array: 1 interest, should pass
it 'should return `true` for valid data: interest'->
  assert !validate
    id: 1
    name: 'JW Test'
    email: 'jasonw@a.com'
    taxRate: 0.1
    favouriteColour: '#323232'
    interest: ['cycling']

#TS6.3 array: 2 interest, but duplicated, should pass (business to confirm)
it 'should return `true` for valid data: interest'->
  assert !validate
    id: 1
    name: 'JW Test'
    email: 'jasonw@a.com'
    taxRate: 0.1
    favouriteColour: '#323232'
    interest: ['cycling', 'cycling']

#TS6.4 array: 0 interest, should pass. (business to confirm)
it 'should return `true` for valid data: interest'->
  assert !validate
    id: 1
    name: 'JW Test'
    email: 'jasonw@a.com'
    taxRate: 0.1
    favouriteColour: '#323232'
    interest: []

#TS6.5 array: 1 interest, len=0 should pass. (business to confirm)
it 'should return `true` for valid data: interest'->
  assert !validate
    id: 1
    name: 'JW Test'
    email: 'jasonw@a.com'
    taxRate: 0.1
    favouriteColour: '#323232'
    interest: ['']

#TS6.6 array: 1 interest, len=1 should pass
it 'should return `true` for valid data: interest'->
  assert !validate
    id: 1
    name: 'JW Test'
    email: 'jasonw@a.com'
    taxRate: 0.1
    favouriteColour: '#323232'
    interest: ['1']

#TS6.7 array: 1 interest, len=31 should pass
it 'should return `true` for valid data: interest'->
  assert !validate
    id: 1
    name: 'JW Test'
    email: 'jasonw@a.com'
    taxRate: 0.1
    favouriteColour: '#323232'
    interest: ['1234567890123456789012345678901']


#TS6.8 array: 1 interest, len=32 should fail
it 'should return `false` for invalid data: interest'->
  assert !validate
    id: 1
    name: 'JW Test'
    email: 'jasonw@a.com'
    taxRate: 0.1
    favouriteColour: '#323232'
    interest: ['12345678901234567890123456789012']

#TS6.9 no more than 4 interests: 4 interests, should pass
it 'should return `true` for valid data: interest'->
  assert !validate
    id: 1
    name: 'JW Test'
    email: 'jasonw@a.com'
    taxRate: 0.1
    favouriteColour: '#323232'
    interest: ['interest1', 'interest2', 'interest3', 'interest4']

#TS6.10 no more than 4 interests: 5 interests, should fail
it 'should return `false` for invalid data: interest'->
  assert !validate
    id: 1
    name: 'JW Test'
    email: 'jasonw@a.com'
    taxRate: 0.1
    favouriteColour: '#323232'
    interest: ['interest1', 'interest2', 'interest3', 'interest4', 'interest5']

# done by JW. au.linkedin.com/in/jwtest
# For some test cases, please consult Business for the expected results
# thanks
