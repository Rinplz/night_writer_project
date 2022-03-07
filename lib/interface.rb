class Interface

  def initialize(args)
    @output_file_path = args[1].path
    @input_file_path = args[0].path
  end

  def character_counter
    counting = File.open(@input_file_path, "r")
    counting.read.length.to_s
  end

  def creation_message
    p "Created '#{File.basename(@output_file_path)}' containing #{character_counter} characters"
  end

end
