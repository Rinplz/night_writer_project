require_relative 'dictionary'
class Translator

  def initialize(string)
    @to_translate = string
    @translations = Dictionary.new
  end

  def translate_to_braille
    translated_string = ''
    format_for_braille.each do |index|
      3.times do |count|
        index.each_char do |character|
          translated_string << @translations.translation[character][count]
        end
      translated_string << "\n"
      end
    end
    translated_string
  end

  def translate_to_roman
    translated_string = ''
    format_for_roman.each_slice(3) do |index|
      translated_string << @translations.translation.key(index)
    end
    translated_string
  end

  def format_for_braille
    @to_translate.downcase.tr('^a-z ','').scan(/.{1,40}/)
  end

  def format_for_roman

    split_by_line = @to_translate.split("\n")

    top_characters = []
    middle_characters = []
    bottom_characters = []

    (split_by_line.length / 3).times do |n|
      top_characters << split_by_line[n * 3].scan(/.{1,2}/)
      middle_characters << split_by_line[(n * 3) + 1].scan(/.{1,2}/)
      bottom_characters << split_by_line[(n * 3) + 2].scan(/.{1,2}/)
    end

    top_characters.flatten.zip(middle_characters.flatten,bottom_characters.flatten).flatten

  end

end
