class Interface

  def initialize(args)
    @output_file_path = args[1].path
    @input_file_path = args[0].path
    @output_file_name = File.basename(args[1].path)
  end

  def character_counter
    counting = File.open(@input_file_path, "r")
    counting.read.length.to_s
  end

  def creation_message
    p "Created '#{@output_file_name}' containing #{character_counter} characters"
  end

end
