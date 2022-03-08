require_relative 'dictionary'
class Translator

  def initialize(string)
    @to_translate = string
    @translations = Dictionary.new
  end

  def translate
    translated_string = ''
    3.times do |count|
      @to_translate.each_char do |character|
        translated_string << @translations.translation[character][count]
      end
      translated_string << "\n"
    end
    translated_string
  end
end
