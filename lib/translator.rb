require_relative 'dictionary'
class Translator

  def initialize(string)
    @to_translate = string
    @translations = Dictionary.new
  end

  def translate
    translated_string = ''
    format.each do |index|
      3.times do |count|
        index.each_char do |character|
          translated_string << @translations.translation[character][count]
        end
      translated_string << "\n"
      end
    end
    translated_string
  end

  def format
    @to_translate.scan(/.{1,40}/)
  end
end
