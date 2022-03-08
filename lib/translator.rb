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
    @to_translate.scan(/.{1,40}/)
  end

  def format_for_roman
    # formatted_string = []
    # braille = @to_translate.scan(/.{1,2}/)
    # braille_letter_count.each do |index|
    #   index.times do |n|
    #     formatted_string << braille[n]
    #     formatted_string << braille[(n) + index]
    #     formatted_string << braille[(n) + (index*2)]
    #   end
    # end
    # formatted_string

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

  #def braille_letter_count
  #   count = @to_translate.scan(/.{1,2}/).length
  #   count = count / 3
  #   if count <= 40
  #   final_count = [count]
  #   elsif count > 40
  #     while count >= 40
  #       final_count =[] << 40
  #       count =- 40
  #     end
  #     final_count << count
  #   end
  #   final_count
  #end

end
