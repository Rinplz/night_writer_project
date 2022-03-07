class Interface

  def initialize(args)
    @file_name = File.basename(args[1].path)
  end

  def creation_message
    p "Created '#{@file_name}' containing 256 characters"
  end

end
