require_relative 'file_create'
class Interface

  def initialize(args)
    @args = args
    @output_file_path = output_file
    @input_file_path = args[0]
  end

  def output_file
    if File.exist?(@args[1]) == true
      return @args[1]
    else
      file_creator = FileCreate.new(@args)
      return file_creator.create.path
    end
  end

  def character_counter
    counting = File.open(@input_file_path, "r")
    counting.read.length.to_s
  end

  def creation_message
    p "Created '#{File.basename(@output_file_path)}' containing #{character_counter} characters"
  end

end
