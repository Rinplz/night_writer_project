require_relative 'dictionary'
class FileCreate

  def initialize(args)
    @input_file = File.open(args[0])
    @output_file_name = args[1]
  end

  def create
    dir = File.dirname(@input_file)
    new_file = File.open(dir + "/" + @output_file_name, "w")
    new_file.write("#{@input_file.read}")
    return new_file
  end

  def translate
    translator = Dictionary.new

  end
end
