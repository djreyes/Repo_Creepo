require 'open-uri'
require 'nokogiri'

# class File
#   extend MethodGetter
# end
#
# module MethodGetter
#   def get_methods(file)
#     file_string = self.open(file, 'r').read
#
#   end
# end

# begins with .
# ends with first occurence of non letter/number/_/!/?
# if begins with .. then not a method
# if in '' then not a method
# if in "" then must be in #{} to be a method
# +, -, <=>, ===, ==, !=, =~, /, *, %, &, |, <<
#
#   if object it's called on begins with capital letter it is a Class method
#     otherwise, instance method

doc = Nokogiri::HTML(open("http://ruby-doc.org/core-1.9.3"))
p doc.xpath("//a")