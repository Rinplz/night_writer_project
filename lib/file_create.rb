require_relative 'translator'
class FileCreate
  def initialize(args)
    @input_file = args[0]
    @output_file_name = args[1]
  end

  def create
    dir = File.dirname(@input_file)
    message = File.open(@input_file)
    new_file = File.open(dir + "/" + @output_file_name, "w")
    new_file.write("#{braille_string(message.read)}")
    return new_file
  end

  def braille_string(string)
    new_string = Translator.new(string)
    new_string.translate
  end

end
