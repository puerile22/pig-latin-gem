require "./pig_latin/version.rb"

module PigLatin
  class Pig
    @vowels='aeiou'
    def self.translate(str)
      arr=str.split("")
      return arr.join("")+"way" if @vowels.include?(arr[0])
      (0...arr.length).each do |i|
        if @vowels.include?(arr[i+1]) || /y/.match(arr[i+1])
          ans = arr[i+1..-1].join("") + arr[0..i].join("") + 'ay'
          return ans
        end
      end
    end
    def self.trans(str)
      return str+'way' if str[0].match(/[aeiou]/)
      if str[/[aeiou]/].nil? || (str[/y/] &&str.index(str[/y/]) > str.index(str[/[aeiou]/]))
        return str+(str.slice!(str[/[^y]+/])+'ay')
      end
      return str+(str.slice!(str[/[^aeiou]+/])+'ay')
    end
    def self.translate_all(str)
      str.gsub!(/[^[:alpha:]]/," ")
      arr=str.split(" ")
      ans=[]
      arr.each do |word|
        ans << self.trans(word)
      end
      return ans.join(",")
    end
  end
end
str='glove'
p PigLatin::Pig.trans(str)